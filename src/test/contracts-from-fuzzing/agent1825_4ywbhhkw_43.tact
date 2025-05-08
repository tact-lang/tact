struct LevelOne {
    a: Int;
}

struct LevelTwo {
    b: LevelOne;
}

struct LevelThree {
    c: LevelTwo;
}

struct LevelFour {
    d: LevelThree;
}

contract NestedFour {
    val: LevelFour;
    init() {
        self.val=LevelFour{
            d:LevelThree{
                c:LevelTwo{
                    b:LevelOne{a:4321}
                }
            }
        };
    }
}
