FusionMatrix
============

FusionMatrix is a toolkit created by Kristof Indeherberge and Cedric Duriau to
allow easy node based matrix operations.

Requirements
------------
- `lua-matrix <https://github.com/davidm/lua-matrix>`_: Lua matrix library.

Installation
------------

**fusionmatrix**

1. Clone or download the repository.
2. Set the absolute path of the **./fusion** directory into the Fusion
   **UserPaths:** path mapping.

**lua-matrix**

1. Clone or download the repository.
2. Set the absolute path of the **./lua** directory into the Fusion
   **LuaModules:** path mapping.

Contents
--------

**Fuses**

- creatematrix.fuse: Fuse to create a 4x4 matrix.
- readmatrix.fuse: Fuse to read a matrix from metadata of an image.
- transposematrix.fuse: Fuse to transpose a matrix.
- writematrix.fuse: Fuse to write a matrix to metadata of an image.


**Modules/Lua**

- matrixutils.lua: Core module using lua-matrix.
