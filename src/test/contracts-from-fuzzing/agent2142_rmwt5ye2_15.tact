struct OptionalDeep {
    a: Int?;
    b: Level1?;
}

struct Level1 {
    c: Int?;
    d: Level2?;
}

struct Level2 {
    e: Int?;
    f: Level3?;
}

struct Level3 {
    g: Int?;
}

contract OptDeepContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            a: null,
            b: Level1{
                c: null,
                d: Level2{
                    e: null,
                    f: Level3{
                        g: null,
                    },
                },
            },
        };
    }
}
