struct Base {
    id: Int;
}

struct Wrap1 {
    base: Base;
}

struct Wrap2 {
    w1: Wrap1;
}

struct Wrap3 {
    w2: Wrap2;
}

contract VeryDeepWrap {
    deepVal: Wrap3;

    init() {
        self.deepVal = Wrap3{ w2: Wrap2{ w1: Wrap1{ base: Base{ id: 7 } } } };
    }
}