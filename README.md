# fork
FORtran Kind module

This library is a single module aimed to define kinds for integer and real types.
I know that there is the iso_fortran_env and fork_m uses this but a few reasons motivated the need for this.

- Writing real32 or SELECTED_REAL_KIND(6) everytime is a pain
- Always having to define a kind_m or types_m for any fortran project is also a pain and redundant
- 'use fork_m' is less typing than 'use, intrinsic :: iso_fortran_env'
- We can abuse the preprocessor to change the names from the default provided

### To Do
 - Add unit tests
 - Add character definitions
