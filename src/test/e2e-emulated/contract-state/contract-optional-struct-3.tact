struct C {
    a: Int;
}

struct S {
    a: Int;
    b: Int;
    c: C? = C { a: 10 };
}

contract TestGetterOptional {
    s: S? = S { a: 1, b: 2 };

    init() {
        self.s = null;
    }

    receive() {}

    get fun S(): S? { return self.s }
}
