contract OptionalDeepNesting {
    field: Level1?;
    init() {
        self.field = Level1{
            l2: Level2{
                l3: Level3{
                    value: 10,
                },
            },
        };
    }
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    value: Int;
}