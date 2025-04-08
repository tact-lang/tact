struct DeepInner {
    x: Int = 123;
}

struct Middle {
    deep: DeepInner = DeepInner{};
}

struct Top {
    mid: Middle = Middle{};
}

contract DeepDefaults {
    field: Top;
    init() {
        self.field = Top{};
    }
}