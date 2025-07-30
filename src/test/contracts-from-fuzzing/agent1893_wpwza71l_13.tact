struct BoolLayer1 {
    b: Bool;
}

struct BoolLayer2 {
    v: BoolLayer1;
}

struct BoolLayer3 {
    v: BoolLayer2;
}

struct BoolLayer4 {
    v: BoolLayer3;
}

contract BoolDeep {
    nested: BoolLayer4;

    init() {
        self.nested = BoolLayer4{ v: BoolLayer3{ v: BoolLayer2{ v: BoolLayer1{ b: true } } } };
    }
}