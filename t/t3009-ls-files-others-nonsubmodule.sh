#!/bin/sh

test_description='test git ls-files --others with non-submodule repositories

This test runs git ls-files --others with the following working tree:

    repo-bogus-no-files/
      directory with no files aside from a bogus .git file
    repo-bogus-untracked-file/
      directory with a bogus .git file and another untracked file
'

. ./test-lib.sh

test_expect_success 'setup: expected output' '
	cat >expected <<-EOF
	expected
	output
	repo-bogus-untracked-file/untracked
	EOF
'

test_expect_success 'setup: directories' '
	mkdir repo-bogus-no-files &&
	echo foo >repo-bogus-no-files/.git &&
	mkdir repo-bogus-untracked-file &&
	echo foo >repo-bogus-untracked-file/.git &&
	: >repo-bogus-untracked-file/untracked
'

test_expect_success 'ls-files --others handles non-submodule .git' '
	git ls-files -o >output &&
	test_cmp expected output
'

test_done
