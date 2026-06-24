struct DeepNested {
    nest1: LevelOne;
}

struct LevelOne {
    nest2: LevelTwo;
}

struct LevelTwo {
    nest3: LevelThree;
}

struct LevelThree {
    value: Int;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            nest1: LevelOne{
                nest2: LevelTwo{
                    nest3: LevelThree{
                        value: 42
                    }
                }
            }
        };
    }
}