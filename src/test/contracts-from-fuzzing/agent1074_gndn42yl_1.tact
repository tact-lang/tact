struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    innerInner: InnerMost;
}

struct InnerMost {
    value: Int;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            inner: InnerStruct{
                innerInner: InnerMost{
                    value: 42
                }
            }
        };
    }
}
