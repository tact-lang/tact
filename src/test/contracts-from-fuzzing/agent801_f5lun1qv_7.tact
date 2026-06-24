struct OptionalNestedStruct {
    levelOne: LevelOne?;
}

struct LevelOne {
    levelTwo: LevelTwo?;
}

struct LevelTwo {
    someInt: Int?;
    someBool: Bool?;
}

contract OptionalNestContract {
    root: OptionalNestedStruct;

    init() {
        self.root = OptionalNestedStruct{
            levelOne: LevelOne{
                levelTwo: LevelTwo{
                    someInt: null,
                    someBool: true
                }
            }
        };
    }
}