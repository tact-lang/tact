struct S {
    a: Int;
}

contract TestStructAccess {
    receive() {
        let s: S = S { a: 42 };
        dump(s.a);
    }
}
