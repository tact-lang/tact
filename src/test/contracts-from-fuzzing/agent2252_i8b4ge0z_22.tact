struct Level3 {
    foo: Int;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

struct RootNest {
    l1a: Level1;
    l1b: Level1;
}

contract WideDeepNest {
    nest: RootNest;
    init() {
        self.nest = RootNest{
            l1a: Level1{
                l2a: Level2{
                    l3a: Level3{ foo: 1 },
                    l3b: Level3{ foo: 2 }
                },
                l2b: Level2{
                    l3a: Level3{ foo: 3 },
                    l3b: Level3{ foo: 4 }
                }
            },
            l1b: Level1{
                l2a: Level2{
                    l3a: Level3{ foo: 5 },
                    l3b: Level3{ foo: 6 }
                },
                l2b: Level2{
                    l3a: Level3{ foo: 7 },
                    l3b: Level3{ foo: 8 }
                }
            }
        };
    }
}