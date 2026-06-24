struct DeepNested {
    inner: StructLevel1;
}

struct StructLevel1 {
    inner1: StructLevel2;
}

struct StructLevel2 {
    inner2: StructLevel3;
}

struct StructLevel3 {
    field: Int;
}

contract DeepChain {
    nested: DeepNested;
    init() {
        self.nested = DeepNested{
            inner: StructLevel1{
                inner1: StructLevel2{
                    inner2: StructLevel3{
                        field: 123
                    }
                }
            }
        };
    }
}
