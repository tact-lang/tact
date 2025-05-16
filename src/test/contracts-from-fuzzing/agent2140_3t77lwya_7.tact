struct DeepOptional {
    inner: Level1?;
}

struct Level1 {
    value: Level2?;
}

struct Level2 {
    data: Int;
}

contract DeepOpt {
    data: DeepOptional;
    init() {
        self.data = DeepOptional{ inner: null };
    }
}
