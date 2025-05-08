struct NestedManyLevels {
    l1: LevelTwo;
}

struct LevelTwo {
    l2: LevelThree;
}

struct LevelThree {
    l3: LevelFour;
}

struct LevelFour {
    l4: LevelFive;
}

struct LevelFive {
    val: Int;
}

contract DeepLevels {
    data: NestedManyLevels;
    init() {
        self.data = NestedManyLevels{
            l1: LevelTwo{
                l2: LevelThree{
                    l3: LevelFour{
                        l4: LevelFive{ val: 999 }
                    }
                }
            }
        };
    }
}