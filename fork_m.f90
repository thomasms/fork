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
    use, intrinsic :: iso_fortran_env
    implicit none
    private

    !!
    !! Platform independent integer and real kinds
    !!


    !!          Integer values

    !> Integer - [8 bit] / [1 bytes]
    integer, parameter, public :: ki1 = int8

    !> Integer - [16 bit] / [2 bytes]
    integer, parameter, public :: ki2 = int16

    !> Integer - [32 bit] / [4 bytes]
    integer, parameter, public :: ki4 = int32

    !> Integer - [64 bit] / [8 bytes]
    integer, parameter, public :: ki8 = int64


    !!          Real values

    !> Single precision - [32 bit] / [4 bytes]
    integer, parameter, public :: kr4 = real32

    !> Double precision - [64 bit] / [8 bytes]
    integer, parameter, public :: kr8 = real64

    !> Quad precision - [128 bit] / [16 bytes]
    integer, parameter, public :: kr16 = real128

end module fork_m
