struct EmptyNested {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    d: Int;
}

contract ChainTest {
    chain: EmptyNested;

    init() {
        self.chain = EmptyNested{
            a: Level1{
                b: Level2{
                    c: Level3{
                        d: 99,
                    },
                },
            },
        };
    }
}