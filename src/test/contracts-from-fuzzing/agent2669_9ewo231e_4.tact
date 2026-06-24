struct Level3 {
    v: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

struct Top {
    l1: Level1;
}

contract Inception {
    payload: Top;

    init() {
        self.payload = Top{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        v: 123,
                    },
                },
            },
        };
    }
}
