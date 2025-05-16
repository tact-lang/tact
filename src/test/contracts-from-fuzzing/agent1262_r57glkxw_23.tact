struct OptionalDeepNest {
    a: Int?;
    b: Bool?;
}

struct Level2 {
    child: OptionalDeepNest?;
}

contract MultiLayerOptional {
    data: Level2;
    init() {
        self.data = Level2{ child: null };
    }
}