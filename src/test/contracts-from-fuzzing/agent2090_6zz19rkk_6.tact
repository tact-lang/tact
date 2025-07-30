struct Level3 {
    d: Int;
    e: String?;
    f: Bool;
}

struct Level2 {
    c: Level3;
    optField: Int?;
}

struct Level1 {
    a: Level2;
    b: String;
}

contract DeepNest {
    deep: Level1;

    init() {
        self.deep = Level1{
            a: Level2{
                c: Level3{
                    d: 7,
                    e: null,
                    f: false,
                },
                optField: null,
            },
            b: "deep"
        };
    }
}