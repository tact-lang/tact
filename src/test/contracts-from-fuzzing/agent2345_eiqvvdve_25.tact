struct Zero {
    x: Int;
}
struct One {
    zero: Zero;
}
struct Two {
    one: One;
}
struct Three {
    two: Two;
}

contract Chain3 {
    v: Three;

    init() {
        self.v = Three{ two: Two{ one: One{ zero: Zero{ x: 7 }}}};
    }
}