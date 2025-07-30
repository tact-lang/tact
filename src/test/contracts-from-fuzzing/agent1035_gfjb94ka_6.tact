struct Level3 { v: Int }
struct Level2 { l3: Level3 }
struct Level1 { l2: Level2 }

contract DeepChain {
    data: Level1 = Level1{ l2: Level2{ l3: Level3{ v: 5 } } };
    init() {
        self.data = Level1{ l2: Level2{ l3: Level3{ v: 42 } } };
    }
    receive() {}
}