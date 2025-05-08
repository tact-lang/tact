struct Level0 {
    a: Int;
}

struct Level1 {
    a: Level0?;
}

struct Level2 {
    a: Level1?;
}

struct Level3 {
    a: Level2?;
}

contract NullDeep {
    s: Level3;

    init() {
        self.s = Level3{a:null};
    }
}
