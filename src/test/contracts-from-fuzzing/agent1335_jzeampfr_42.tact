struct FinalLevel {
    x: Int;
}

struct Level3 {
    f: FinalLevel;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepSerializationTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{
                    f: FinalLevel{ x: 77 }
                }
            }
        };
    }
}