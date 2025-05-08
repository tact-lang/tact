struct DeepNested {
    level3: Level3;
}

struct Level3 {
    level2: Level2;
}

struct Level2 {
    level1: Level1;
}

struct Level1 {
    value: Int;
}

contract Test {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{level3: Level3{level2: Level2{level1: Level1{value: 42}}}};
    }
}