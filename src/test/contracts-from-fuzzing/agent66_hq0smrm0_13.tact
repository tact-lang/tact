struct InnerMost {
    v: Int;
}

struct Level3 {
    deep: InnerMost?;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2?;
}

contract Test {
    root: Level1;
    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{
                    deep: InnerMost{
                        v: 999,
                    },
                },
            },
        };
    }
}
