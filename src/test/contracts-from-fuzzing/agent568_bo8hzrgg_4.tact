struct Level3 { x: Int }
struct Level2 { nested: Level3 }
struct Level1 { nested: Level2 }

contract Deep {
    field: Level1;

    init() {
        self.field = Level1{ nested: Level2{ nested: Level3{ x: 5 } } };
    }
}