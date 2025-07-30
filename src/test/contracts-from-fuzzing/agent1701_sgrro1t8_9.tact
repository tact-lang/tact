struct LargeNestingLevelOne {
    lvl2: LargeNestingLevelTwo;
}

struct LargeNestingLevelTwo {
    lvl3: LargeNestingLevelThree;
}

struct LargeNestingLevelThree {
    lvl4: LargeNestingLevelFour;
}

struct LargeNestingLevelFour {
    lvl5: LargeNestingLevelFive;
}

struct LargeNestingLevelFive {
    val: Int;
}

contract DeepPersist {
    data: LargeNestingLevelOne;

    init() {
        self.data = LargeNestingLevelOne{
            lvl2: LargeNestingLevelTwo{
                lvl3: LargeNestingLevelThree{
                    lvl4: LargeNestingLevelFour{
                        lvl5: LargeNestingLevelFive{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}