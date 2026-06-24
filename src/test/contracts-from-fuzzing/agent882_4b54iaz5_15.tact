struct InnerMost {
    a: Int?;
}

struct Inner {
    i: InnerMost?;
}

struct Middle {
    m: Inner?;
}

struct Top {
    t: Middle?;
}

contract FourLayers {
    layer: Top;

    init() {
        self.layer = Top{ t: null };
    }
}