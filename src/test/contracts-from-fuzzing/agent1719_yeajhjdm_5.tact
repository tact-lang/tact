struct Level3 {
    v: Int?;
}

struct Level2 {
    l3: Level3;
    msg: String?;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract DeepNesting {
    field: Level1;

    init() {
        self.field = Level1{
            l2: Level2{
                l3: Level3{
                    v: null
                },
                msg: null
            },
            flag: true
        };
    }
}