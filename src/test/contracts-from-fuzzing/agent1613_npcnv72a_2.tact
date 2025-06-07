struct Level3 {
    x: Bool;
    y: String?;
}

struct Level2 {
    nested: Level3;
    z: Int;
}

struct Level1 {
    opt: Level2?;
    yes: Bool;
}

contract DeepNest {
    piece: Level1;

    init() {
        self.piece = Level1{
            opt: Level2{
                nested: Level3{
                    x: true,
                    y: null,
                },
                z: 7,
            },
            yes: false,
        };
    }
}
