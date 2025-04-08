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

struct LevelFive {
    e: LevelFour;
}

contract ChainFive {
    root: LevelFive;

    init() {
        self.root = LevelFive{
            e: LevelFour{
                d: LevelThree{
                    c: LevelTwo{
                        b: LevelOne{
                            a:42
                        }
                    }
                }
            }
        };
    }
}