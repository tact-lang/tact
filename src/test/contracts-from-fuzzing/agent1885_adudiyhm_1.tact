struct DeeplyNested {
    inner1: InnerLevel1;
}

struct InnerLevel1 {
    inner2: InnerLevel2;
}

struct InnerLevel2 {
    inner3: InnerLevel3?;
}

struct InnerLevel3 {
    leaf: Int?;
}

contract NestedStorage {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner1: InnerLevel1{
                inner2: InnerLevel2{
                    inner3: InnerLevel3{
                        leaf: 42
                    }
                }
            }
        };
    }
}