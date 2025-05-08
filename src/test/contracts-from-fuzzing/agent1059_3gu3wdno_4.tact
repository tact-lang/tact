struct DeeplyNested {
    inner1: Int;
    inner2: Bool;
}

struct MidNested {
    mid1: DeeplyNested;
    mid2: DeeplyNested;
}

struct Outer {
    out1: MidNested;
    out2: MidNested;
}

contract DeepNesting {
    nestedField: Outer;

    init() {
        self.nestedField = Outer{
            out1: MidNested{
                mid1: DeeplyNested{ inner1: 1, inner2: true },
                mid2: DeeplyNested{ inner1: 2, inner2: false }
            },
            out2: MidNested{
                mid1: DeeplyNested{ inner1: 3, inner2: true },
                mid2: DeeplyNested{ inner1: 4, inner2: false }
            }
        };
    }
}