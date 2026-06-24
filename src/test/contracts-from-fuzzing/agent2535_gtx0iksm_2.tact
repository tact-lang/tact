struct Level3 {
    x: Int;
    y: Bool?;
}

struct Level2 {
    nested: Level3;
    s: String?;
}

struct Level1 {
    nested: Level2;
    b: Bool;
}

contract DeepNested {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested: Level2{
                nested: Level3{
                    x: 42,
                    y: null,
                },
                s: "hi",
            },
            b: true,
        };
    }
}