struct DeeplyNested {
    nested: NestedLevel;
}

struct NestedLevel {
    value: InnerMost;
}

struct InnerMost {
    val: Int;
    flag: Bool;
}

contract ContractDeepNest {
    d: DeeplyNested;
    
    init() {
        self.d = DeeplyNested{
            nested: NestedLevel{
                value: InnerMost{
                    val: 10, 
                    flag: true,
                },
            },
        };
    }
}