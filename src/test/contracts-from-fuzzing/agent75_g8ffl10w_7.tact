struct S {
    a: Int;
    b: Int;
}

fun test_field_access(): Int {
    let s: S = S { a: 10, b: 32 };
    return s.a + s.b;
}

contract TestFieldAccess {
    receive() {
        test_field_access();
    }
}
