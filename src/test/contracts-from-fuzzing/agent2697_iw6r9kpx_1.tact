struct DeepNestLevel3 {
    value: Int;
}

struct DeepNestLevel2 {
    nested3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    nested2: DeepNestLevel2;
}

contract Test {
    deep: DeepNestLevel1;

    init() {
        self.deep = DeepNestLevel1{
            nested2: DeepNestLevel2{
                nested3: DeepNestLevel3{
                    value: 123,
                },
            },
        };
    }
}
