struct LevelA {
    ia: Int;
    b: LevelB;
}

struct LevelB {
    ib: Int;
    c: LevelC;
}

struct LevelC {
    ic: Int;
    d: LevelD;
}

struct LevelD {
    id: Int;
    e: LevelE;
}

struct LevelE {
    ie: Int;
}

contract DeepFiveLevels {
    data: LevelA;

    init() {
        self.data = LevelA{
            ia: 1,
            b: LevelB{
                ib: 2,
                c: LevelC{
                    ic: 3,
                    d: LevelD{
                        id: 4,
                        e: LevelE{
                            ie: 5
                        }
                    }
                }
            }
        };
    }
}