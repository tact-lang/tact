struct Level3 {
    v3a: Int?;
    v3b: String?;
}

struct Level2 {
    v2a: Int;
    v2b: Bool?;
    nested3: Level3;
}

struct Level1 {
    v1a: String;
    nested2: Level2;
}

contract MultipleNesting {
    field: Level1;

    init() {
        self.field = Level1{
            v1a: "hi",
            nested2: Level2{
                v2a: 1,
                v2b: null,
                nested3: Level3{
                    v3a: null,
                    v3b: null,
                },
            },
        };
    }
}