struct Level1 {
    n: Int?;
}

struct Level2 {
    lvl1: Level1;
}

struct Level3 {
    lvl2: Level2;
}

contract OptNestTest {
    storage: Level3;
    init() {
        self.storage = Level3{ lvl2: Level2{ lvl1: Level1{ n: null } } };
    }
}