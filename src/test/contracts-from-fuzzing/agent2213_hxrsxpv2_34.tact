struct First {
    foo: Int?;
}

struct Second {
    bar: Int?;
}

contract TwoOpts {
    s1: First;
    s2: Second;

    init() {
        self.s1 = First{ foo: null };
        self.s2 = Second{ bar: null };
    }
}
