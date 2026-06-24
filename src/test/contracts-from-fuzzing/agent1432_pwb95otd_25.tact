struct LevelD {
    valD: Int?;
}

struct LevelC {
    nestedD: LevelD;
}

struct LevelB {
    nestedC: LevelC;
}

struct LevelA {
    nestedB: LevelB;
}

contract TestContract {
    top: LevelA;

    init() {
        self.top = LevelA {
            nestedB: LevelB {
                nestedC: LevelC {
                    nestedD: LevelD { valD: null }
                }
            }
        };
    }
}