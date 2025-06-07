struct InnerMost {
    val: Int?;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract DeepOptionalChain {
    s: Outer;
    init() {
        self.s = Outer{
            mid: Middle{
                inner: InnerMost{
                    val: 123
                }
            }
        };
    }
}