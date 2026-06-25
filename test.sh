#!/bin/bash
if ./app.sh >/dev/null 2>&1; then
	echo "PASS"
else
	echo "FAIL"
fi
