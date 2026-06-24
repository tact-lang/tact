struct Level3 {
    l3a: Int;
}

struct Level2 {
    l2a: Int;
    l2struct: Level3;
}

struct Level1 {
    l1a: Int;
    l1struct: Level2;
}

contract DeepNestingLevels {
    nested: Level1;

    init() {
        self.nested = Level1{
            l1a:1,
            l1struct: Level2{
                l2a: 2,
                l2struct: Level3{
                    l3a: 3
                }
            }
        };
    }
}