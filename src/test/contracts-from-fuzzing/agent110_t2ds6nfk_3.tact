struct Level3 { f: Int }

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNest {
    lvl: Level1;

    init() {
        self.lvl = Level1{ l2: Level2{ l3: Level3{ f: 42 } } };
    }
}