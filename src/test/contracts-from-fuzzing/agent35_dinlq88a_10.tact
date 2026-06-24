struct InnerMost {
    im: Int?;
}
struct Middle {
    m1: InnerMost;
    m2: InnerMost;
}
struct Inner {
    mid: Middle;
}

contract TestContract {
    nested: Inner;
    num: Int;

    init() {
        self.nested = Inner{
            mid: Middle{
                m1: InnerMost{ im: null },
                m2: InnerMost{ im: 5 }
            }
        };
        self.num = 777;
    }
}