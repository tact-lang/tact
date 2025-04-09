struct OuterMost {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
    opt: Int?;
}

struct Level2 {
    level3: Level3;
    flag: Bool;
}

struct Level3 {
    x: Int;
    y: String;
}

contract TestContract {
    s: OuterMost;

    init() {
        self.s = OuterMost{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        x: 42,
                        y: "deep",
                    },
                    flag: false,
                },
                opt: null,
            }
        };
    }
}
