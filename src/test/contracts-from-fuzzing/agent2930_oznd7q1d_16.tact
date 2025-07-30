struct FewNestedLevels {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    someString: String;
    someBool: Bool;
    someInt: Int;
}

contract DeepMixNested {
    val: FewNestedLevels;

    init() {
        self.val = FewNestedLevels{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        someString: "hi",
                        someBool: false,
                        someInt: -77
                    }
                }
            }
        };
    }
}
