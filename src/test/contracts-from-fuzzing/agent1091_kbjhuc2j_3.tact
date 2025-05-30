struct Level3 {
    z: Int?;
}

struct Level2 {
    y: Level3?;
}

struct Level1 {
    x: Level2?;
}

contract DeepOptional {
    field: Level1?;

    init() {
        self.field = Level1{
            x: Level2{
                y: Level3{
                    z: 42
                }
            }
        };
    }
}