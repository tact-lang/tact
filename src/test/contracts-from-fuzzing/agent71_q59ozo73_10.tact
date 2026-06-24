struct InnerMost {
    z: Int;
}

struct MiddleNested {
    inner: InnerMost;
}

struct OuterStruct {
    middle: MiddleNested;
}

contract MultiDepth {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct{
            middle: MiddleNested{
                inner: InnerMost{
                    z: 999
                }
            }
        };
    }
}