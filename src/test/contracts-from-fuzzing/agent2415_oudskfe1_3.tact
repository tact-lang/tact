struct Level3 {
    w: Int?;
}

struct Level2 {
    z: Level3;
}

struct Level1 {
    y: Level2?;
}

contract DeepNest {
    deepField: Level1;

    init() {
        self.deepField = Level1{
            y: Level2{
                z: Level3{
                    w: 42
                }
            }
        };
    }
}