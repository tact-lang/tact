struct Level3 { val3: Int; }
struct Level2 { lvl3: Level3; }
struct Level1 { lvl2: Level2; }

contract DeepNest {
    nested: Level1;

    init() {
        self.nested = Level1{ lvl2: Level2{ lvl3: Level3{ val3: 42 } } };
    }
}