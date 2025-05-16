struct Level3 {
    foo: Int;
}

struct Level2 {
    lvl3Opt: Level3? = null;
}

struct Level1 {
    lvl2Opt: Level2? = null;
}

contract TestC {
    lvl1Opt: Level1?;

    init() {
        self.lvl1Opt = null;
    }
}