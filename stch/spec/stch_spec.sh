% FIXTURE: "$SHELLSPEC_HELPERDIR/fixture"

Describe 'stch'
    Describe 'Including other stch files'
        It 'substitutes and evals the included file'
            Data "{{>$FIXTURE/inc.stch}}"
            When call ./stch
            The stdout should equal foo
            The status should be success
        End
        It 'exists with non-zero on invalid file'
            Data '{{>foo}}'
            When call ./stch
            The stderr should include "foo: No such file or directory"
            The status should be failure
        End
    End
    Describe 'Environment variable substitution'
        BeforeAll ""
        Before 'export STCH_TEST="STCH_TEST"; unset _UNSET'
        After "unset STCH_TEST"
        AfterAll "rm -rf $FIXTURE/inc"
        It 'substitutes ${} with vars'
            Data '${STCH_TEST}'
            When call ./stch
            The stdout should equal STCH_TEST
            The status should be success
        End
        It 'exits with non-zero on unset env'
            Data '${_UNSET}'
            When call ./stch
            The status should be failure
        End
        It "doesn't interp bare $ vars"
            Data '$STCH_TEST'
            When call ./stch
            The stdout should equal '$STCH_TEST'
            The status should be success
        End
    End
    Describe 'command substitution'
        It 'substitutes command output inside {{!}}'
            Data '{{!echo 1}}'
            When call ./stch
            The stdout should equal '1'
            The status should be success
        End
        It 'exits with non-zero on invalid command'
            Data '{{!foo}}'
            When call ./stch
            The stderr should include 'foo: not found'
            The status should be failure
        End
    End
End
