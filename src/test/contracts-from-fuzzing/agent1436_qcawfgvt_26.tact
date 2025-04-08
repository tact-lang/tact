// Multiple levels of nested non-optional structs
struct Level3 { v: Int }
struct Level2 { x: Level3 }
struct Level1 { y: Level2 }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{ y: Level2 { x: Level3 { v: 123 } } };
    }
}
