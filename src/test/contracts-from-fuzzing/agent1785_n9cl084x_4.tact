struct DeepNested {
    level1: Int;
    level2: NestedLevel2;
}

struct NestedLevel2 {
    flag: Bool;
    inner: NestedLevel3;
}

struct NestedLevel3 {
    optionalInnerVal: Int?;
    strVal: String;
}

contract ManyDeepNesting {
    complexField: DeepNested;

    init() {
        self.complexField = DeepNested{
            level1: 1,
            level2: NestedLevel2{
                flag: true,
                inner: NestedLevel3{
                    optionalInnerVal: null,
                    strVal: "abc",
                },
            },
        };
    }
}