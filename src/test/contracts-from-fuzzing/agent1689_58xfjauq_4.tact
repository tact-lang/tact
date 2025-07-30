struct DeepOptional {
    x: Level2?;
}

struct Level2 {
    y: Level3?;
}

struct Level3 {
    z: Int?;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            x: Level2{
                y: Level3{
                    z: 77
                }
            }
        };
    }
}