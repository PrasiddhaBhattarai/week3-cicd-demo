# Week 3 CI/CD Demo

A demonstration Python application showcasing a complete **Continuous Integration and Continuous Deployment (CI/CD)** pipeline using GitHub Actions.

## Overview

This repository demonstrates best practices for automated testing, building, and deployment workflows. The project includes two primary GitHub Actions workflows:

- **CI Pipeline (Continuous Integration)**: `ci.yml`
- **CD Pipeline (Continuous Deployment)**: `cd.yml`

## Repository Structure

```text
week3-cicd-demo/
├── .github/
│   └── workflows/
│       ├── ci.yml          # Continuous Integration workflow
│       └── cd.yml          # Continuous Deployment workflow
├── app.py                  # Main Python application
├── app.sh                  # Application launcher script
├── test.sh                 # Test runner script
├── requirements.txt        # Python dependencies
└── README.md               # This file
```

## CI/CD Workflows

### 1. Continuous Integration Pipeline (`ci.yml`)

The CI pipeline automatically runs on every push and pull request to validate code quality and functionality.

#### Triggers

- `push`: Every push to any branch
- `pull_request`: Pull requests targeting the `main` branch
- `workflow_dispatch`: Manual trigger via GitHub Actions UI

#### Key Features

- **Multi-version Testing**: Tests against Python 3.10, 3.11, and 3.12
- **Dependency Management**:
  - Installs dependencies from `requirements.txt`
  - Caches pip packages for faster builds
- **Environment Configuration**: Reads `APP_ENV` from repository secrets
- **Application Execution**:
  - Runs the application via `app.sh`
  - Executes tests via `test.sh`
- **Artifact Upload**: Uploads build artifacts including scripts and documentation

#### Workflow Steps

1. Checkout repository code
2. Set up specified Python version
3. Cache pip dependencies to improve performance
4. Install project requirements
5. Display environment information (if staging)
6. Make shell scripts executable
7. Execute application (`app.sh`)
8. Run tests (`test.sh`)
9. Upload artifacts for download

---

### 2. Continuous Deployment Pipeline (`cd.yml`)

The CD pipeline extends the CI workflow by adding automated deployment capabilities.

#### Triggers

- `push`: On push to `main` branch only
- `workflow_dispatch`: Manual trigger with environment selection

#### Manual Deployment Options

When triggered manually, you can select the deployment target:

- `staging` (default)
- `production`

#### Workflow Jobs

##### Job 1: Test

Identical to the CI pipeline, ensuring all tests pass before deployment:

- Multi-version Python testing
- Dependency installation and caching
- Application execution and validation
- Test suite execution
- Artifact upload

##### Job 2: Deploy

Runs only after tests pass and only on `main` branch updates:

- Outputs deployment information:
  - Application status message
  - Git commit SHA (for traceability)
  - Actor who triggered the deployment
  - Target environment
  - Deployment timestamp

#### Deployment Features

- **Conditional Execution**: Only deploys when tests succeed
- **Branch Protection**: Only deploys from `main` branch
- **Environment Tracking**: Uses GitHub's environment management
- **Audit Trail**: Logs commit SHA and actor information

## Configuration

### Python Versions

Both workflows test across three Python versions for compatibility:

- Python 3.10
- Python 3.11
- Python 3.12

### Dependencies

Install required packages by specifying them in `requirements.txt`:

```txt
# Add your dependencies here
```

### Secrets

Configure repository secrets for sensitive data:

- `APP_ENV`: Application environment setting (e.g., `"staging"`)

Access in workflows via:

```yaml
${{ secrets.APP_ENV }}
```

## Running the Workflows

### Automatic Triggers

- **CI**: Automatically runs on every push and pull request
- **CD**: Automatically deploys to staging on push to `main`

### Manual Trigger

Visit the **Actions** tab in GitHub to manually trigger workflows:

1. Select the workflow (`CI pipeline` or `CI/CD pipeline`)
2. Click **Run workflow**
3. For the CD pipeline, select your target environment (`staging` or `production`)
4. Click **Run workflow**

## Monitoring & Artifacts

### View Workflow Status

- GitHub Actions tab shows real-time workflow execution
- Workflow logs are available for debugging and troubleshooting

### Download Artifacts

After workflow completion, download build artifacts:

- `app.sh` — Application launcher
- `test.sh` — Test runner
- `app.py` — Python application
- `README.md` — Documentation

## Best Practices Demonstrated

✅ **Matrix Testing** — Test across multiple Python versions  
✅ **Caching** — Optimize build times with pip caching  
✅ **Secrets Management** — Secure sensitive configuration  
✅ **Artifact Preservation** — Store build outputs for later use  
✅ **Conditional Deployment** — Deploy only on successful tests  
✅ **Branch Protection** — Deploy only from the main branch  
✅ **Audit Trail** — Track deployments with commit and actor information  
✅ **Manual Overrides** — Allow manual workflow dispatch with environment options

## Troubleshooting

### Workflow Failures

- Check the workflow logs in the **Actions** tab
- Verify Python version compatibility
- Ensure all dependencies are listed in `requirements.txt`
- Confirm `app.sh` and `test.sh` have the correct execution permissions

### Deployment Issues

- Verify the `APP_ENV` secret is configured correctly
- Check that branch protection rules allow deployments
- Review deployment job logs for environment-specific details
