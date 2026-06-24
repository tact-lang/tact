struct DeepNested {
    one: LevelOne;
}

struct LevelOne {
    two: LevelTwo;
}

struct LevelTwo {
    three: LevelThree;
}

struct LevelThree {
    val: Int?;
}

contract NestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            one: LevelOne{
                two: LevelTwo{
                    three: LevelThree{
                        val: null
                    }
                }
            }
        };
    }
}