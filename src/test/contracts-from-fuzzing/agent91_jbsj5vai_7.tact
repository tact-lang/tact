struct MultiLevel {
    lvl1: Level1;
    lvl2: Level2;
}

struct Level1 {
    inner: Int;
}

struct Level2 {
    deepInner: Level3;
    flag: Bool;
}

struct Level3 {
    val: Int;
}

contract MultiLevelNested {
    data: MultiLevel;

    init() {
        self.data = MultiLevel{
            lvl1: Level1{ inner: 55 },
            lvl2: Level2{ deepInner: Level3{ val: 78 }, flag: true }
        };
    }
}
