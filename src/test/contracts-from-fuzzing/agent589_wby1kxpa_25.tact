struct One {
    a: Int;
}

struct Two {
    b: Int;
    c: Slice;
}

contract Combined {
    first: One;
    second: Two;

    init() {
        self.first = One{a: 1};
        self.second = Two{b: 2, c: emptyCell().asSlice()};
    }
}