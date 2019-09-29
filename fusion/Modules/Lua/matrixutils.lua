-- ============================================================================
-- modules
-- ============================================================================
local matrix = self and require("matrix") or nil
local json = self and require("dkjson") or nil

-- module table
matrixutils = {}

function matrixutils.matrix_from_vector(rows, cols, value)
    --[[
        Builds a matrix object from a vector.

        :param rows: Row dimension of the matrix.
        :type rows: int

        :param cols: Column dimension of the matrix.
        :type cols: int

        :param value: Table representing a vector to build matrix from.
        :type value: table

        :rtype: matrix
    ]]
    local mat = matrix(rows, cols)
    local r = 1
    local c = 1

    for i, v in ipairs(value) do
        -- get matrix value at row x column
        mat[r][c] = v

        if i % cols == 0 then
            r = r + 1  -- bump row counter
            c = 0  -- reset column counter to zero, restarts next loop at 1
        end

        c = c + 1
    end

    return mat
end

function matrixutils.matrix_to_vector(mat)
    --[[
        Builds a vector from a matrix object.

        :param mat: Matrix object to build vector from.
        :type mat: matrix

        :rtype: table
    ]]
    local vec = {}

    for r=1, matrix.rows(mat) do
        for c=1, matrix.columns(mat) do
            table.insert(vec, mat[r][c])
        end
    end

    return vec
end

function matrixutils.matrix_to_string(mat)
    --[[
        Builds an interchangeable json string from a matrix object.

        :param mat: Matrix object to build json string from.
        :type mat: matrix

        :rtype: string
    ]]
    -- matrix to custom table
    local mat_table = {}

    mat_table["rows"] = matrix.rows(mat)
    mat_table["columns"] = matrix.columns(mat)
    mat_table["vector"] = matrixutils.matrix_to_vector(mat)

    -- custom table to json string
    local json_str = json.encode(mat_table)

    return json_str
end

function matrixutils.matrix_from_string(mat_str)
    --[[
        Builds a matrix object from an interchangeable json string.

        :param mat_str: Json string to build matrix object from.
        :type mat_str: string

        :rtype: matrix
    ]]
    -- custom table from json string
    local mat_table = json.decode(mat_str)

    -- matrix from custom table
    local rows = mat_table["rows"]
    local cols = mat_table["columns"]
    local vec = mat_table["vector"]
    local mat = matrixutils.matrix_from_vector(rows, cols, vec)

    return mat
end

-- return module table
return matrixutils
