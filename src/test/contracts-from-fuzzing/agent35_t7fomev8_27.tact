struct InnerMost {
    x: Int;
}

struct Middle {
    innerMost: InnerMost?;
}

struct OuterMost {
    middle: Middle?;
}

contract TestContract {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            middle: Middle{
                innerMost: InnerMost{
                    x: 42
                }
            }
        };
    }
}
