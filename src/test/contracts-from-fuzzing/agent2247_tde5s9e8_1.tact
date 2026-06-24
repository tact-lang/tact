struct DeeplyNested {
    f1: Int;
    f2: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: InnerMost?;
}

struct InnerMost {
    x: Int;
    y: Bool;
}

contract Test {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            f1: 1,
            f2: InnerStruct{
                a: 2,
                b: InnerMost{
                    x: 3,
                    y: true
                }
            }
        };
    }
}
