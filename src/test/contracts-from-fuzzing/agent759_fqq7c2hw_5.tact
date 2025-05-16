struct Level3 {
    value: Int;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract ChainNested {
    holder: Level1;

    init() {
        self.holder = Level1{
            nested2: Level2{
                nested3: Level3{
                    value: 77,
                },
            },
        };
    }
}
