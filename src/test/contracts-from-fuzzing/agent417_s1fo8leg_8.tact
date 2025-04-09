struct Level3 {
    z1: Int?;
    z2: String?;
}

struct Level2 {
    y1: Int;
    y2: Level3?;
}

struct Level1 {
    x1: Bool;
    x2: Level2?;
}

contract TestContract {
    deepOpt: Level1;

    init() {
        self.deepOpt = Level1{
            x1: true,
            x2: Level2{
                y1: 123,
                y2: null
            }
        };
    }
}