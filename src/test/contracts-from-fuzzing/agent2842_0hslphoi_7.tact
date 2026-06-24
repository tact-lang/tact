struct InnerMost {
    u: Int;
    v: String?;
}

struct Middle {
    im: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract MultiOptionNest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                im: InnerMost{
                    u: 42,
                    v: null
                }
            }
        };
    }
}