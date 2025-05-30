struct DeepNested {
    in1: Int;
    in2: Bool;
}

struct MidNested {
    d1: DeepNested;
    d2: DeepNested;
}

contract TripleNested {
    nested: MidNested;

    init() {
        self.nested = MidNested{
            d1: DeepNested{ in1: 1, in2: false },
            d2: DeepNested{ in1: 2, in2: true }
        };
    }
}