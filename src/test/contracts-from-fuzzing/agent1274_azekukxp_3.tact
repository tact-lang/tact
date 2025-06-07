struct Deep {
    level1: Int;
    level2: Int?;
    level3: Int;
    level4: Int?;
    level5: Int;
}

contract DeepNestedStruct {
    deep: Deep;

    init() {
        self.deep = Deep{
            level1: 1,
            level2: null,
            level3: 3,
            level4: null,
            level5: 5,
        };
    }
}