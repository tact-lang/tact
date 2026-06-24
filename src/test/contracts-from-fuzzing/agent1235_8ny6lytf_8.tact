struct Zero {
    val: Int;
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

contract VeryDeep {
    data: Three;

    init() {
        self.data = Three{ two: Two{ one: One{ zero: Zero{ val: 777 }}}};
    }
}