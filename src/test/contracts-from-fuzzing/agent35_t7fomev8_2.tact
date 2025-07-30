struct DeeplyNested {
    level1: Int;
    level2: NestedLevel2;
}

struct NestedLevel2 {
    level3: NestedLevel3;
}

struct NestedLevel3 {
    flag: Bool;
    val: Int;
}

contract TestContract {
    deep: DeeplyNested;

    init() {
        self.deep = DeeplyNested{
            level1: 10,
            level2: NestedLevel2{
                level3: NestedLevel3{
                    flag: true,
                    val: 42,
                },
            },
        };
    }
}
