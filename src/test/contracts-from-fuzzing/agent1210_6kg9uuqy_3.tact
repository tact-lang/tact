struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract DeepNest {
    v: Level1;

    init() {
        self.v = Level1{
            x: Level2{
                y: Level3{
                    z: 123,
                },
            },
        };
    }
}