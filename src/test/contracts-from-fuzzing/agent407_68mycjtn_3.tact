struct DoubleNested {
    sub1: DeepNest2;
    sub2: NestedOpt;
}

contract DeepCombo {
    field: DoubleNested;
    init() {
        self.field = DoubleNested{
            sub1: DeepNest2{ d1: DeepNest1{ a: 42 } },
            sub2: NestedOpt{ x: 1, y: null, z: null },
        };
    }
}

struct DeepNest1 { a: Int; }
struct DeepNest2 { d1: DeepNest1; }
struct NestedOpt { x: Int?; y: String?; z: Cell?; }
