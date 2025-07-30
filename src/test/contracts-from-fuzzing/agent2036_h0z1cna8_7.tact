struct DeeplyOptional {
    inner: Int?;
}

struct Level2 {
    nested: DeeplyOptional?;
}

struct Level1 {
    nested: Level2?;
}

contract OptNest {
    data: Level1?;

    init() {
        self.data = null;
    }
}