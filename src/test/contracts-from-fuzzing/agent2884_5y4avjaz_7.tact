struct Level4 { v: Int = 1; }
struct Level3 { l4: Level4 = Level4{}; }
struct Level2 { l3: Level3 = Level3{}; }
struct Level1 { l2: Level2 = Level2{}; }

contract TestContract {
    l1: Level1 = Level1{};

    init() {}
}