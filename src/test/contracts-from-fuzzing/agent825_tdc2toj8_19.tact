struct Base {
    a:Int;
}

struct Level1 {
    l1: Base;
    b:Int;
}

struct Level2 {
    l2: Level1;
    c:Int;
}

struct Level3 {
    l3: Level2;
    d:Int;
}

contract MultiDeepTest {
    deep: Level3;

    init() {
        self.deep = Level3{
            l3: Level2{
                l2: Level1{
                    l1: Base{a:1},
                    b:2,
                },
                c:3,
            },
            d:4,
        };
    }
}