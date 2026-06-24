struct Level3 {
    a: Int;
}

struct Level2 {
    a: Int;
    l3: Level3;
}

struct Level1 {
    a: Int;
    l2: Level2;
}

struct RootNested {
    a: Int;
    l1: Level1;
}

contract DeeplyNestedStruct {
    s: RootNested;
    init() {
        self.s = RootNested{
            a: 1,
            l1: Level1{
                a: 2,
                l2: Level2{
                    a: 3,
                    l3: Level3{
                        a: 4
                    }
                }
            }
        };
    }
}