struct Level3 {
    z: Int?;
}

struct Level2 {
    y: Level3;
    optString: String?;
}

struct Level1 {
    x: Bool;
    nested: Level2;
}

contract DeepNest {
    stuff: Level1;

    init() {
        self.stuff = Level1{
            x: true,
            nested: Level2{
                y: Level3{ z: 99 },
                optString: null,
            },
        };
    }
}