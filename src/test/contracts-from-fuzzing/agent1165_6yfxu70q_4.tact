struct Level3 { val3: Int; }
struct Level2 { l3: Level3; val2: Int; }
struct Level1 { l2: Level2; val1: Int; }

contract DeeplyNested {
    nested: Level1;
    
    init() {
        self.nested = Level1{ l2: Level2{ l3: Level3{ val3: 3 }, val2: 2 }, val1: 1 };
    }
}
