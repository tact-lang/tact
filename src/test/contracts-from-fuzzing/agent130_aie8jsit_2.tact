struct Level3 { val: Int; }

struct Level2 { nested: Level3; }

struct Level1 { nested: Level2; }

contract DeepNest {
    deep: Level1;

    init() {
        self.deep = Level1{ nested: Level2{ nested: Level3{ val: 123 } } };
    }
}