struct Level3 { val3: Int; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract DeepNest {
    root: Level1;

    init() {
        self.root = Level1{ l2: Level2{ l3: Level3{ val3: 123 } } };
    }
}