struct LevelA {
    b: LevelB;
}

struct LevelB {
    c: LevelC;
}

struct LevelC {
    d: LevelD;
}

struct LevelD {
    e: Int;
}

contract ChainNesting {
    data: LevelA;

    init() {
        self.data = LevelA{
            b: LevelB{
                c: LevelC{
                    d: LevelD{
                        e: 55
                    }
                }
            }
        };
    }
}