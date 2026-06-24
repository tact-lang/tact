struct InnerDeep {
    value: Int?;
}

struct Level2 {
    inner: InnerDeep?;
}

struct Level1 {
    level2: Level2?;
}

contract OptionalChain {
    root: Level1?;

    init() {
        self.root = null;
    }
}