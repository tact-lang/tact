struct Level3 {
    flag: Bool;
}

struct Level2 {
    mid: Level3;
    opt: String?;
}

struct Level1 {
    nested: Level2;
    value: Int;
}

contract DeepNest {
    s: Level1;

    init() {
        self.s = Level1{
            nested: Level2{
                mid: Level3{
                    flag: true
                },
                opt: null
            },
            value: 123
        };
    }
}