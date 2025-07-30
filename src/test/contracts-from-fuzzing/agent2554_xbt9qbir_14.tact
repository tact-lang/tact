struct InnerMost {
    u: Int as uint8;
    v: Bool?;
    w: String = "hi";
}
struct Mid {
    m: Int?;
    im: InnerMost;
}
struct Top {
    x: Mid;
    y: Bool = false;
}

contract MixedDeep {
    data: Top;

    init() {
        self.data = Top{
            x: Mid{
                m: null,
                im: InnerMost{
                    u: 100,
                    v: null
                    // w defaults to "hi"
                }
            }
            // y defaults to false
        };
    }
}