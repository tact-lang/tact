struct Level3 {
    l3a: Int;
    l3b: Bool;
}

struct Level2 {
    l2a: Int;
    l2b: Level3;
}

struct Level1 {
    l1a: Level2;
    l1b: Int;
}

contract DeepNest {
    deep: Level1;

    init() {
        self.deep = Level1{
            l1a: Level2{
                l2a: 7,
                l2b: Level3{
                    l3a: 11,
                    l3b: true,
                },
            },
            l1b: 42,
        };
    }
}