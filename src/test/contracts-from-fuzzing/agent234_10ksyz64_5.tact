struct Level3 { f: Int }
struct Level2 { nested: Level3 }
struct Level1 { nested: Level2 }

contract DeepChain {
    data: Level1;

    init() {
        self.data = Level1{ nested: Level2{ nested: Level3{ f: 123 } } };
    }
}