struct Level3Opt {
    x: Int?;
}

struct Level2Opt {
    lvl3: Level3Opt?;
}

struct Level1Opt {
    lvl2: Level2Opt?;
}

contract DeepOptionalsContract {
    data: Level1Opt?;

    init() {
        self.data = null;
    }
}