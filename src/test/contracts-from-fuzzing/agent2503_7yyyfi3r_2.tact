struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    innerInner: InnerInnerStruct;
}

struct InnerInnerStruct {
    flag: Bool;
    data: Slice;
}

contract Test {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested{
            inner: InnerStruct{
                innerInner: InnerInnerStruct{
                    flag: true,
                    data: "test".asSlice(),
                }
            }
        };
    }
}
