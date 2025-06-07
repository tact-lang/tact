struct TripleNested {
    a: Int? = null;
}

struct Double {
    b: TripleNested = TripleNested{};
}

struct Single {
    c: Double = Double{};
}

contract Combo {
    f: Single = Single{};
    init() {
        self.f = Single{};
    }
}