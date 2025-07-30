struct Bottom {
    s: String?;
}

struct Middle {
    mid: Bottom?;
}

contract NullableChain {
    top: Middle?;

    init() {
        self.top = Middle { mid: null };
    }
}