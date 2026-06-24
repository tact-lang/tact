struct S {
    a: Int;
    b: Bool;
}

contract StructGetter {
    s: S;

    init() {
        self.s = S { a: 123, b: true };
    }

    receive() {}

    get fun getS(): S {
        return self.s;
    }
}
