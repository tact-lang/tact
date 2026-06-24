struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    val: Int;
}

contract DeepThreeNested {
    data: Level1;
    init() {
        self.data = Level1{ lvl2: Level2{ lvl3: Level3{ val: 42 } } };
    }
}