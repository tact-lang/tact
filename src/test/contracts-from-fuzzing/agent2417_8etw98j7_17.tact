struct Level3 {
    val: Int;
}

struct Level2 {
    sub: Level3;
}

struct Level1 {
    wrap: Level2;
}

contract MultiWrap {
    field: Level1;

    init() {
        self.field = Level1{ wrap: Level2{ sub: Level3{ val: 99 } } };
    }
}
