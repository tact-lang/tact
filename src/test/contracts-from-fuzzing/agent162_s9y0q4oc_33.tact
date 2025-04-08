struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

struct Level0 {
    l1: Level1;
}

contract TestContract {
    nested: Level0;

    init() {
        self.nested = Level0{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        x: 42
                    }
                }
            }
        };
    }
}