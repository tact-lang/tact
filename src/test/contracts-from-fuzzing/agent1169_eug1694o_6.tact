struct Level3 {
    deep: Int;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract ExtremeDeepNesting {
    nested: Level1;

    init() {
        self.nested = Level1{lvl2: Level2{lvl3: Level3{deep: 999}}};
    }
}