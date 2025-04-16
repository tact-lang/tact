struct Base {
    x: Int;
    y: Int;
}

struct Level1 {
    a: Base;
    b: Base;
}

struct Level2 {
    l1: Level1;
    l2: Level1;
}

struct Level3 {
    l2a: Level2;
    l2b: Level2;
}

contract MultiDepth {
    data: Level3;

    init() {
        self.data = Level3{
            l2a: Level2{
                l1: Level1{ a: Base{ x:1,y:2 }, b: Base{ x:3,y:4 } },
                l2: Level1{ a: Base{ x:5,y:6 }, b: Base{ x:7,y:8 } }
            },
            l2b: Level2{
                l1: Level1{ a: Base{ x:9,y:10 }, b: Base{ x:11,y:12 } },
                l2: Level1{ a: Base{ x:13,y:14 }, b: Base{ x:15,y:16 } }
            }
        };
    }
}