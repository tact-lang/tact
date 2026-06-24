struct Level3 {
    a: Int;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract NestedDeepAllDefault {
    data: Level1 = Level1{lvl2: Level2{lvl3: Level3{a: 123}}};

    init() {
        self.data = Level1{lvl2: Level2{lvl3: Level3{a: 456}}};
    }
}