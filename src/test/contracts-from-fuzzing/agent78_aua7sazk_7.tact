struct S {
    a: Int;
    b: Bool;
}

contract TestFieldAccess {
    receive() {
        let s = S{ a: 10, b: true };
        dump(s.a);
        dump(s.b);
        dump(s.a + 2);
    }
}
