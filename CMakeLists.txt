##========================================================================== //
## Copyright (c) 2020, Stephen Henry
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions are met:
##
## * Redistributions of source code must retain the above copyright notice, this
##   list of conditions and the following disclaimer.
##
## * Redistributions in binary form must reproduce the above copyright notice,
##   this list of conditions and the following disclaimer in the documentation
##   and/or other materials provided with the distribution.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
## AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
## ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
## LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
## CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
## SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
## INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
## CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
## ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
## POSSIBILITY OF SUCH DAMAGE.
##========================================================================== //

cmake_minimum_required(VERSION 3.5)
project(qs)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(${CMAKE_SOURCE_DIR}/cmake/qs.cmake)

set(CMAKE_CXX_STANDARD 17)

# Enable waveform dump (VCD)
option(OPT_VCD_ENABLE "Enable VCD waveform dumping." OFF)

# Enable logging to tracefile.
option(OPT_TRACE_ENABLE "Enable log tracing." OFF)

# Enable verbose logging.
option(OPT_VERBOSE "Verbose logging." OFF)

# Configure RTL

# The maximum number of elements to be counted.
set(OPT_N 16 CACHE STRING "The number of values to sort.")

# The width of each sorted element
set(OPT_W 32 CACHE STRING "The width of each sorted value.")

# The number of internal banks
set(OPT_BANKS_N 3 CACHE STRING "The number of internal sorting banks.")

find_package(Verilator)

message(STATUS "Parameter: N = ${OPT_N}")
message(STATUS "Parameter: W = ${OPT_W}")
message(STATUS "Parameter: BANKS_N = ${OPT_BANKS_N}")

add_subdirectory(third_party)
add_subdirectory(pd)
add_subdirectory(libv)
add_subdirectory(rtl)

enable_testing()
add_subdirectory(tb)
