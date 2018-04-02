!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!                                               !!
!!                    FORK                       !!
!!                                               !!
!!      Copyright (c) 2018, Thomas Stainer       !!
!!                                               !!
!!            All rights reserved.               !!
!!    Licensed under the 3-clause BSD license.   !!
!!                                               !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

module fork_m
    implicit none
    private

    !> Single precision
    integer, parameter, public :: sp = kind(1.0)

    !> Double precision
    integer, parameter, public :: dp = selected_real_kind(2*precision(1.0_sp))

    !> Quad precision
    integer, parameter, public :: qp = selected_real_kind(2*precision(1.0_dp))

end module fork_m
