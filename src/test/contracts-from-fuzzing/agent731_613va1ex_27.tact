struct Levels {
    a: Int;
    b: LevelB;
}

struct LevelB {
    c: Int;
    d: LevelC;
}

struct LevelC {
    e: Int;
    f: Bool;
}

contract MultiLevels {
    lvl: Levels;

    init() {
        self.lvl = Levels{ a: 7, b: LevelB{ c: 8, d: LevelC{ e: 9, f: true } } };
    }
}