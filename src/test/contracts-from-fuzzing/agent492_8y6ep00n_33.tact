struct LevelFour {
    val: Int;
}

struct LevelThree {
    nested: LevelFour;
}

struct LevelTwo {
    nested: LevelThree;
}

struct LevelOne {
    nested: LevelTwo;
}

contract TestContract {
    data: LevelOne;
    init() {
        self.data = LevelOne{
            nested: LevelTwo{
                nested: LevelThree{
                    nested: LevelFour{val: 5}
                }
            }
        };
    }
}