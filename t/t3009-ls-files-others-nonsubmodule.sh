#!/bin/sh

test_description='test git ls-files --others with non-submodule repositories'

. ./test-lib.sh

test_expect_success 'setup: expected output' '
	cat >expected <<-EOF
	expected
	output
	EOF
'

test_expect_success 'ls-files --others handles non-submodule .git' '
	mkdir not-a-submodule &&
	echo foo >not-a-submodule/.git &&
	git ls-files -o >output &&
	test_cmp expected output
'

test_done
