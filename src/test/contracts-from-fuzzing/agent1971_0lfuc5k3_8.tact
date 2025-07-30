struct Level3 {
    deepVal: Int;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract DeepThreeLevels {
    nested1: Level1;

    init() {
        self.nested1 = Level1{
            nested2: Level2{
                nested3: Level3{ deepVal: 123 }
            }
        };
    }
}
