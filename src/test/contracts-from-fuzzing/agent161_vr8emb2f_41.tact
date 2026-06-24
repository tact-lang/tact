// Contract with unusual ordering: nested optionals intertwined

struct A {
    b: B?;
    c: Bool?;
    d: String;
}

struct B {
    e: C?;
    f: Int;
}

struct C {
    g: String?;
    h: Int;
}

contract InterleavedNestedOptionals {
    root: A;

    init() {
        self.root = A{
            b: null,
            c: null,
            d: "end",
        };
    }
}
