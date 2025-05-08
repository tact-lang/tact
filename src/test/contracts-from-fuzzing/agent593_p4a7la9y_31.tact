struct InnerMostS {
    x: Int;
}

struct Wrap1 {
    v: InnerMostS;
}

struct Wrap2 {
    w: Wrap1;
}

struct Wrap3 {
    w2: Wrap2;
}

contract WrappedDeep {
    d: Wrap3;

    init() {
        self.d = Wrap3{ w2: Wrap2{ w: Wrap1{ v: InnerMostS{ x: 11 } } } };
    }
}