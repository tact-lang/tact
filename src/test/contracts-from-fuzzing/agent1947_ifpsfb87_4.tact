struct Level3 {
    f1: Int;
    f2: Bool;
}

struct Level2 {
    nested: Level3;
    flag: Bool?;
}

struct Level1 {
    nested: Level2;
    count: Int?;
}

contract MultiLayerNest {
    obj: Level1;
    init() {
        self.obj = Level1{
            nested: Level2{
                nested: Level3{
                    f1: 42,
                    f2: true,
                },
                flag: null,
            },
            count: null,
        };
    }
}