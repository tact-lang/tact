struct Level3 {
    c1: Int;
    c2: String?;
}

struct Level2 {
    b1: Int;
    b2: Level3;
    b3: Bool;
}

struct Level1 {
    a1: String;
    a2: Int?;
    a3: Level2;
}

contract AlternatingOptional {
    info: Level1;

    init() {
        self.info = Level1{
            a1: "lvl1",
            a2: null,
            a3: Level2{
                b1: 42,
                b2: Level3{
                    c1: -1,
                    c2: null,
                },
                b3: true,
            },
        };
    }
}