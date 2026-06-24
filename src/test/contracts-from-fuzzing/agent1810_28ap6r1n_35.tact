struct Level2Opt {
    x: Int?;
}

struct Level1Opt {
    inner: Level2Opt?;
}

contract OptInNestedOpt {
    lvl: Level1Opt?;

    init() {
        self.lvl = null;
    }
}