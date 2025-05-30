contract MathOps {
    // Testing divc: should round up division
    // According to docs, divc(x, y) returns the rounded up result of x/y
    get fun test_divc(): Int {
        return divc(3, 2); // expected result: 2
    }

    // Testing muldivc: computes rounded up (x * y) / z
    get fun test_muldivc(): Int {
        return muldivc(4, 1, 2); // expected result: 2
    }

    // Testing mulShiftRight: computes floor((x * y) / 2^z)
    get fun test_mulShiftRight(): Int {
        return mulShiftRight(4, 1, 2); // expected result: 1
    }

    // Testing sha256 with a compile-time resolvable string
    get fun test_sha256(): Int {
        return sha256("Hello, Tact!");
    }
}
