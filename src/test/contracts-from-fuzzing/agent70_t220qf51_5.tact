struct S { 
    a: Int;
    b: Bool;
}

contract Test {
    s: S = S { a: 1, b: true };

    receive() {}

    get fun getS(): S {
        return self.s;
    }
}
