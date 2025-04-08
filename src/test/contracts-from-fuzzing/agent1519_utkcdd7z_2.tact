struct LevelA {
    levelB: LevelB;
}

struct LevelB {
    levelC: LevelC;
}

struct LevelC {
    levelD: LevelD;
}

struct LevelD {
    levelE: LevelE;
}

struct LevelE {
    number: Int;
}

contract DeepFive {
    nested: LevelA;

    init() {
        self.nested = LevelA{
            levelB: LevelB{
                levelC: LevelC{
                    levelD: LevelD{
                        levelE: LevelE{
                            number: 42
                        }
                    }
                }
            }
        };
    }
}
