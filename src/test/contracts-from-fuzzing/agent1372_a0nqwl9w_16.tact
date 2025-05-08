struct DeepOptionalChain {
    x: Int?;
    y: String?;
    z: Bool?;
}

struct Level1 {
    d: DeepOptionalChain?;
}

struct Level2 {
    l1: Level1?;
}

contract Test {
    field: Level2;
    init() {
        self.field = Level2{
            l1: null,
        };
    }
}