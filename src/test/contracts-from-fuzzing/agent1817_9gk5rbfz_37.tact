// Chain of nested structs with default values
struct Level1 { x: Int = 1; }
struct Level2 { l1: Level1 = Level1{}; }
struct Level3 { l2: Level2 = Level2{}; }
struct Level4 { l3: Level3 = Level3{}; }

contract ManyDefaultsChain {
    top: Level4;

    init() {
        self.top = Level4{};
    }
}