struct Level3 {
    val: Bool;
}

struct Level2 {
    nested3: Level3;
}

struct Level1 {
    nested2: Level2;
}

contract DeepNested {
    field: Level1;

    init() {
        self.field = Level1{
            nested2: Level2{
                nested3: Level3{
                    val: true,
                },
            },
        };
    }
}