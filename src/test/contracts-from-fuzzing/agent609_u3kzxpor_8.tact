struct Level3 { val: Int; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract DeepChain {
    nested: Level1;

    init() {
        self.nested = Level1{ l2: Level2{ l3: Level3{ val: 777 } } };
    }
}