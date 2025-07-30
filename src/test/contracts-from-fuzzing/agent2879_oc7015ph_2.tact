struct Deep {
    num: Int;
    flag: Bool;
}

struct Mid {
    deep: Deep;
}

struct Outer {
    mid: Mid;
}

contract Test {
    nested: Outer;

    init() {
        self.nested = Outer{mid: Mid{deep: Deep{num: 42, flag: true}}};
    }
}