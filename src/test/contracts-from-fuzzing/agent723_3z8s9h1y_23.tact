struct Level0 {
    x: Int;
}

struct Level1 {
    a: Level0;
    b: Level0;
}

struct Level2 {
    m: Level1;
    n: Level1;
}

struct Level3 {
    p: Level2;
    q: Level2;
}

contract TestContract {
    root: Level3;

    init() {
        self.root = Level3{
            p: Level2{
                m: Level1{
                    a: Level0{ x: 1 },
                    b: Level0{ x: 2 }
                },
                n: Level1{
                    a: Level0{ x: 3 },
                    b: Level0{ x: 4 }
                }
            },
            q: Level2{
                m: Level1{
                    a: Level0{ x: 5 },
                    b: Level0{ x: 6 }
                },
                n: Level1{
                    a: Level0{ x: 7 },
                    b: Level0{ x: 8 }
                }
            }
        };
    }
}