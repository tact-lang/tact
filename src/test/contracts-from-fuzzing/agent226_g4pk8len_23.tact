struct LevelBottom { val: Int; }

struct LevelMid {
    sub1: LevelBottom;
    sub2: LevelBottom;
}

struct LevelTop {
    m1: LevelMid;
    m2: LevelMid;
}

contract MultiNested {
    root: LevelTop;

    init() {
        self.root = LevelTop{
            m1: LevelMid{
                sub1: LevelBottom{ val:1 },
                sub2: LevelBottom{ val:2 }
            },
            m2: LevelMid{
                sub1: LevelBottom{ val:3 },
                sub2: LevelBottom{ val:4 }
            }
        };
    }
}