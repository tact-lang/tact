struct Leaf {
    a: Int as uint32;
    b: Bool;
}

struct Mid {
    leaf: Leaf;
    note: String;
}

struct Top {
    mid: Mid;
    flag: Bool;
}

contract NestedMixedSerialized {
    s: Top;

    init() {
        self.s = Top{ mid: Mid{ leaf: Leaf{ a: 123, b: false }, note: "hi"}, flag: true };
    }
}