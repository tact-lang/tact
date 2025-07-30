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
}

contract FourLevels {
    root: LevelA;

    init() {
        self.root = LevelA{ levelB: LevelB{ levelC: LevelC{ levelD: LevelD{ flag:true } } } };
    }
}