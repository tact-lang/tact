struct Bottom {
    v: Int = 42;
}

struct Middle {
    b: Bottom;
}

struct Top {
    m: Middle;
}

contract DeepDefaults {
    data: Top;
    init() {
        self.data = Top{ m: Middle{ b: Bottom{} } };
    }
}