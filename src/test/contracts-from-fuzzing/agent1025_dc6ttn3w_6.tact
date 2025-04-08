struct LevelOne {
    intVal: Int;
    levelTwo: LevelTwo;
}

struct LevelTwo {
    strVal: String;
    levelThree: LevelThree;
}

struct LevelThree {
    addressVal: Address;
    boolVal: Bool;
}

contract DeepTree {
    root: LevelOne;

    init() {
        self.root = LevelOne{
            intVal: 1,
            levelTwo: LevelTwo{
                strVal: "data",
                levelThree: LevelThree{
                    addressVal: myAddress(),
                    boolVal: true
                }
            }
        };
    }
}