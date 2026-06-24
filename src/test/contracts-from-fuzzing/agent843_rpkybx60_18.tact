struct InnerMost {
    z: Int?;
}

struct Middle {
    y: InnerMost?;
}

contract OptionalChain {
    x: Middle?;

    init() {
        self.x = Middle{ y: InnerMost{ z: null } };
    }
}
