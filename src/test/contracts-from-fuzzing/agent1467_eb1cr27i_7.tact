struct NestedMix {
    level1: Int;
    level2: DeepNested;
}

struct DeepNested {
    level3: Int?;
    level4: Bool;
}

contract ComplexStruct {
    val: NestedMix;
    init() {
        self.val = NestedMix{
            level1: 123,
            level2: DeepNested{
                level3: null,
                level4: true
            }
        };
    }
}