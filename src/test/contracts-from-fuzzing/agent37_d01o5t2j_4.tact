struct Deep {
    level2: Int;
}

struct Mid {
    level1: Deep;
}

struct Top {
    core: Mid;
}

contract VeryDeep {
    nested: Top;
    init() {
        self.nested = Top{ core: Mid{ level1: Deep{ level2: 42 } } };
    }
}