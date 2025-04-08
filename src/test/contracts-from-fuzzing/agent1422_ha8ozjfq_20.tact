struct Vector {
    a: Int;
    b: Int;
}

struct Matrix {
    row1: Vector;
    row2: Vector;
}

contract NestedStructArrays {
    m: Matrix;

    init() {
        self.m = Matrix{
            row1: Vector{a:1,b:2},
            row2: Vector{a:3,b:4},
        };
    }
}