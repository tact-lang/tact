struct A {
    int1: Int;
    bool1: Bool;
}

struct B {
    str: String;
    optBool: Bool?;
}

struct C {
    first: A;
    second: B;
    number: Int;
    optStr: String?;
}

contract NestedOpts {
    store: C;

    init() {
        self.store = C{
            first: A{ int1: 1, bool1: false },
            second: B{ str: "abc", optBool: null },
            number: 42,
            optStr: null,
        };
    }
}