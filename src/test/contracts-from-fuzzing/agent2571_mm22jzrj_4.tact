struct Level3 {
    z: Int?;
}

struct Level2 {
    y: Level3;
    v: String?;
}

struct Level1 {
    x: Level2;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            x: Level2{
                y: Level3{
                    z: null,
                },
                v: "deep",
            },
        };
    }
}
