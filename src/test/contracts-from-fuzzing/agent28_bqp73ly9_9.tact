struct InnerMost {
    x: Int;
}

struct Middle {
    inner: InnerMost;
}

struct OuterMost {
    mid: Middle;
}

contract DeepNest3 {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mid: Middle{
                inner: InnerMost{ x: 10 }
            }
        };
    }
}