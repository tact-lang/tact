struct DeeplyNested {
    f1: Int;
    f2: Inner;
}

struct Inner {
    innerF1: Int;
    innerF2: InnerMost;
}

struct InnerMost {
    leaf1: Int;
    leaf2: Bool;
    leaf3: String;
}

contract TestNestedStructs {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            f1: 1,
            f2: Inner{
                innerF1: 2,
                innerF2: InnerMost{
                    leaf1: 3,
                    leaf2: true,
                    leaf3: "leaf"
                }
            }
        };
    }
}