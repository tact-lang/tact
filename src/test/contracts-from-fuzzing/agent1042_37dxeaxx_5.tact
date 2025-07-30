struct InnerMost {
    val: Int?
}

struct Middle {
    inner: InnerMost
}

struct OuterMost {
    middle: Middle
}

contract OptionalDeepNest {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            middle: Middle{
                inner: InnerMost{val: null}
            }
        };
    }
}