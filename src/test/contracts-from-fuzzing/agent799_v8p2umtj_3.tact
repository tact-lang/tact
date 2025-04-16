struct Level3 {
    a: Int;
}

struct Level2 {
    nested3a: Level3;
    nested3b: Level3;
}

struct Level1 {
    nested2a: Level2;
    nested2b: Level2;
}

contract DeepNesting {
    nest: Level1;

    init() {
        self.nest = Level1{
            nested2a: Level2{
                nested3a: Level3{a: 1},
                nested3b: Level3{a: 2},
            },
            nested2b: Level2{
                nested3a: Level3{a: 3},
                nested3b: Level3{a: 4},
            },
        };
    }
}