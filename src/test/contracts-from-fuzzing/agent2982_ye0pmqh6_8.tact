struct Level3 {
    x: Int?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract DeepOptionalsTest {
    nested: Level1 = Level1{ l2: null };

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{ x: 99 }
            }
        };
    }
}