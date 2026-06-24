struct Level3 { a: Int; }

struct Level2 { l3: Level3; }

struct Level1 { l2: Level2; }

contract DeepNest {
    val: Level1 = Level1{ l2: Level2{ l3: Level3{ a: 42 } } };

    init() {
        self.val = Level1{ l2: Level2{ l3: Level3{ a: 100 } } };
    }
}