contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    value: 42
                }
            }
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
