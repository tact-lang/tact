struct One {
    value: Int;
}

struct Two {
    one: One;
}

struct Three {
    two: Two;
}

contract NestedChain {
    c: Three;

    init() {
        self.c = Three { two: Two { one: One { value: 7 } } };
    }
}