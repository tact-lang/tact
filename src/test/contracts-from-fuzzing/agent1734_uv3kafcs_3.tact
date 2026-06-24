struct DeepLevel {
    val: Int?;
}

struct Middle {
    deep: DeepLevel;
}

struct Top {
    middle: Middle?;
}

contract Test {
    storage: Top;
    init() {
        self.storage = Top{ middle: null };
    }
}