struct OptionalDeeper {
    maybeA: LevelA?;
}

struct LevelA {
    maybeB: LevelB?;
}

struct LevelB {
    maybeC: LevelC?;
}

struct LevelC {
    maybeD: LevelD?;
}

struct LevelD {
    maybeE: LevelE?;
}

struct LevelE {
    maybeF: LevelF?;
}

struct LevelF {
    value: Int;
}

contract TestContract {
    st: OptionalDeeper;

    init() {
        self.st = OptionalDeeper{
            maybeA: LevelA{
                maybeB: LevelB{
                    maybeC: LevelC{
                        maybeD: LevelD{
                            maybeE: LevelE{
                                maybeF: LevelF{
                                    value: 999
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}