struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost;
}

struct OuterMost {
    middle: Middle;
}

contract DeepNest {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            middle: Middle{
                inner: InnerMost{
                    value: 999
                }
            }
        };
    }
}