struct DeeplyNested {
    inner: LevelA;
}

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
    x: Int;
    y: Bool;
}

contract DeepNestStore {
    val: DeeplyNested;
    init() {
        self.val = DeeplyNested {
            inner: LevelA {
                levelB: LevelB {
                    levelC: LevelC {
                        levelD: LevelD {
                            x: 555,
                            y: true
                        }
                    }
                }
            }
        };
    }
}