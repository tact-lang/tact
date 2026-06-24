struct Level1 {
    innerOpt: Level2?;
}

struct Level2 {
    x: Int;
    y: Int?;
    z: Level3?;
}

struct Level3 {
    msg: String?;
}

contract DeepOptMix {
    field: Level1;
    init() {
        self.field = Level1{
            innerOpt: Level2{
                x: 1,
                y: null,
                z: Level3{ msg: "deep" }
            }
        };
    }
}