struct Bottom {
    comment: String = "deep";
}

struct Middle {
    bottom: Bottom = Bottom{};
    label: String = "mid";
}

struct Top {
    middle: Middle = Middle{};
    title: String = "top";
}

contract DeepStringDefaults {
    t: Top;

    init() {
        self.t = Top{};
    }
}
