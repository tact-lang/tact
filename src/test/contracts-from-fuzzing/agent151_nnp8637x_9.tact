struct Level3 {
    l3field: Int;
}

struct Level2 {
    l2field: Level3;
}

struct Level1 {
    l1field: Level2;
}

contract Test {
    s: Level1;

    init() {
        self.s = Level1{
            l1field: Level2{
                l2field: Level3{
                    l3field: 123,
                },
            },
        };
    }
}