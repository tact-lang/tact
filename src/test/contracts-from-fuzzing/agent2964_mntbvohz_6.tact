struct InnerMost {
    val: Int?;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    inn: Inner;
}

contract OptionalDeep {
    s: Outer;

    init() {
        self.s = Outer{
            inn: Inner{
                im: InnerMost{
                    val: null
                }
            }
        };
    }
}