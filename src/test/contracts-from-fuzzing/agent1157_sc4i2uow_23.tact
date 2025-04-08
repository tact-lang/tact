struct InnerMost {
    a: Int;
}

struct Inner {
    x: InnerMost;
}

struct Middle {
    m: Inner;
}

contract OptionalDeepStruct {
    s: Middle?;

    init() {
        self.s = Middle{ m: Inner{ x: InnerMost{ a: 7 } } };
    }
}