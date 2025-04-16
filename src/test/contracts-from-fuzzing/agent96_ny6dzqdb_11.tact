struct Level3 {
    f1: Int;
    f2: Bool?;
}

struct Level2 {
    nested3: Level3;
    s: String?;
}

struct Level1 {
    nested2: Level2;
    i: Int?;
    flag: Bool;
}

contract Test {
    s: Level1;

    init() {
        self.s = Level1{
            nested2: Level2{
                nested3: Level3{
                    f1: 7,
                    f2: null
                },
                s: null
            },
            i: null,
            flag: true
        };
    }
}