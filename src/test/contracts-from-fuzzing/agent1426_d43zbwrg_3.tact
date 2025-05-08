struct BigNest {
    lvl1: Int;
    lvl2: Int?;
    lvl3: Level3;
}

struct Level3 {
    deepVal: Int;
    optDeep: Level4?;
}

struct Level4 {
    val: Int;
    flag: Bool;
}

contract DeepStorage {
    data: BigNest;

    init() {
        self.data = BigNest{
            lvl1: 1,
            lvl2: null,
            lvl3: Level3{
                deepVal: 2,
                optDeep: Level4{ val: 3, flag: false }
            }
        };
    }
}