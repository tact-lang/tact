struct Level4 { a: Int }
struct Level3 { nested: Level4 }
struct Level2 { nested: Level3 }
struct Level1 { nested: Level2 }

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{ nested: Level2{ nested: Level3{ nested: Level4{ a: 42 } } } };
    }
}