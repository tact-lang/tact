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
    flag: Bool;
    txt: String?;
}

contract MultiDeepOpt {
    data: LevelA;

    init() {
        self.data = LevelA{
            levelB: LevelB{
                levelC: LevelC{
                    levelD: LevelD{
                        flag: true,
                        txt: null
                    }
                }
            }
        };
    }
}
