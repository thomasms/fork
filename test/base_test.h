program MACRO_TEST_NAME
    use fork_m
    implicit none

    integer, parameter :: KIND1 = MACRO_KIND1
    integer, parameter :: KIND2 = MACRO_KIND2
    integer, parameter :: KIND3 = MACRO_KIND3
    integer, parameter :: KIND4 = MACRO_KIND4

    integer(KIND1) :: i
    integer(KIND2) :: j
    integer(KIND3) :: k
    integer(KIND4) :: l

    integer :: passcount
    integer :: failcount

    passcount = 0
    failcount = 0

    !> Since 127 is the largest integer for KIND1
    !! adding one should
    i = 127_KIND1
    if(i + 1_KIND1 == -128_KIND1)then
        call incrementcounter(passcount)
    else
        call incrementcounter(failcount)
    end if

    !> Since 32767 is the largest integer for KIND2
    !! adding one should
    j = 32767_KIND2
    if(j + 1_KIND2 == -32768_KIND2)then
        call incrementcounter(passcount)
    else
        call incrementcounter(failcount)
    end if

    !> Since 2147483647 is the largest integer for KIND3
    !! adding one should
    k = 2147483647_KIND3
    if(k + 1_KIND3 == -2147483648_KIND3)then
        call incrementcounter(passcount)
    else
        call incrementcounter(failcount)
    end if

    !> Since 9223372036854775807 is the largest integer for KIND4
    !! adding one should
    l = 9223372036854775807_KIND4
    if(l + 1_KIND4 == -9223372036854775808_KIND4)then
        call incrementcounter(passcount)
    else
        call incrementcounter(failcount)
    end if

    !> Print summary
    call printsummary()

    !> If any failed then exit with code 1
    if(failcount > 0) then
        stop 1
    end if

contains

    subroutine incrementcounter(count)
        integer, intent(inout) :: count

        count = count + 1
    end subroutine incrementcounter

    subroutine printsummary()
        write(*, "(A, I2.1, A, I2.1)") "Pass count: ", passcount, "/",passcount+failcount
        write(*, "(A, I2.1, A, I2.1)") "Fail rate: ", failcount, "/",passcount+failcount
    end subroutine printsummary

end program MACRO_TEST_NAME
