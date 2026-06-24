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
    store: Level1;

    init() {
        self.store = Level1{ lvl2: Level2{ lvl3: Level3{ val: 99 } } };
    }
}