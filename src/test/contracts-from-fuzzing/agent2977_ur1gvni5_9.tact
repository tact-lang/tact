struct First {
    foo: Int;
}

struct Second {
    bar: Int;
}

contract StructTuple {
    f: First;
    s: Second;

    init() {
        self.f = First{ foo: 1 };
        self.s = Second{ bar: 2 };
    }
}