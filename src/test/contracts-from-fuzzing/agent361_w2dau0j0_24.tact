struct Leaf {
    x: Int;
}

struct Nester {
    a: Leaf;
}

contract TopFlat {
    f1: Leaf;
    f2: Nester;

    init() {
        self.f1 = Leaf{ x: 10 };
        self.f2 = Nester{ a: Leaf{ x: 20 } };
    }
}
