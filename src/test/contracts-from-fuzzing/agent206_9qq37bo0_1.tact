struct DeepNested {
    inner1: InnerLevel1;
}

struct InnerLevel1 {
    inner2: InnerLevel2;
}

struct InnerLevel2 {
    inner3: InnerLevel3;
}

struct InnerLevel3 {
    value: Int;
}

contract TestStorage {
    nestedField: DeepNested;

    init() {
        self.nestedField = DeepNested{
            inner1: InnerLevel1{
                inner2: InnerLevel2{
                    inner3: InnerLevel3{
                        value: 42
                    }
                }
            }
        };
    }
}
