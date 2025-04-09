struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    nested: InnerMost;
}

struct InnerMost {
    value: Int;
}

contract NestedDepth {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner: InnerStruct{
                nested: InnerMost{
                    value: 123
                }
            }
        };
    }
}
