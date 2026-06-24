struct Bottom {
    v: Int = 42;
}

struct Middle {
    m: Bottom = Bottom{};
}

struct Top {
    t: Middle = Middle{};
}

contract DefaultsChain {
    val: Top;

    init() {
        self.val = Top{};
    }
}