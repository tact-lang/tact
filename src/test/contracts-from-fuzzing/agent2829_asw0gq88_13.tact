struct Level5 {
    v5: Int;
}

struct Level4 {
    l5: Level5;
}

struct Level3 {
    l4: Level4;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNestingFive {
    store: Level1;

    init() {
        self.store = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        l5: Level5{
                            v5: 12345,
                        },
                    },
                },
            },
        };
    }
}
