struct DeepNested {
    level3: Int?;
}

struct MidNested {
    deep: DeepNested;
}

struct OuterNested {
    mid: MidNested;
}

contract DeepNestedStruct {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            mid: MidNested{
                deep: DeepNested{ level3: null }
            }
        };
    }
}