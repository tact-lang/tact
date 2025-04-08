struct Level3 {
    val: Int;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract DeepNested {
    storage: Level1;

    init() {
        self.storage = Level1{ lvl2: Level2{ lvl3: Level3{ val: 42 } } };
    }
}