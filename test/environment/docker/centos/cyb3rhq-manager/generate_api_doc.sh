#!/usr/bin/env bash
/var/ossec/framework/python/bin/python3 ./generate_rst.py /cyb3rhq-documentation/source/user-manual/api/reference.rst
cd /cyb3rhq-documentation
make html
