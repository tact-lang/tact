struct Level3 {
    z: String?;
}

struct Level2 {
    y: Level3?;
}

struct Level1 {
    x: Level2?;
}

contract DeepOptionalNest {
    data: Level1;

    init() {
        self.data = Level1{
            x: null,
        };
    }
}