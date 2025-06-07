struct InnerMost {
    n: Int;
}

struct Inner {
    im: InnerMost;
}

struct Mid {
    innerStruct: Inner;
}

struct Level {
    mid: Mid;
}

contract TestContract {
    lvl: Level;

    init() {
        self.lvl = Level{
            mid: Mid{
                innerStruct: Inner{
                    im: InnerMost{
                        n: 1
                    }
                }
            }
        };
    }
}
