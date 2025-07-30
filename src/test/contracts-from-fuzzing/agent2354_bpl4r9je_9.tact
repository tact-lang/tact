struct Level3 {
    flag: Bool;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract NestedWithDefaults {
    nested1: Level1;

    init() {
        self.nested1 = Level1{
            nested2: Level2{
               nested3: Level3{ flag: true }
            }
        };
    }
}