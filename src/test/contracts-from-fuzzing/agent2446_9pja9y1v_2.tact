struct DeepNested {
    d1: Int;
    d2: Bool;
}

struct InnerNested {
    b1: Int;
    b2: DeepNested;
}

struct OuterNested {
    a1: Bool;
    a2: InnerNested;
}

contract DeepContract {
    nested: OuterNested;

    init() {
        self.nested = OuterNested{
            a1: true,
            a2: InnerNested{
                b1: 5,
                b2: DeepNested{d1: 10, d2: false}
            }
        };
    }
}