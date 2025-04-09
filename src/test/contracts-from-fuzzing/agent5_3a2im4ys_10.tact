struct S {
    a: Int;
    b: Int;
}

contract TestFieldAccess {
    receive() {
        let s: S = S { a: 10, b: 20 }; // instantiation allows comma separator
        let sum: Int = s.a + s.b;
    }
}
