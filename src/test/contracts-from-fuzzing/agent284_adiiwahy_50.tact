struct InnerMost {
    content: Int;
}

struct MiddleOpt {
    inner: InnerMost?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract DeepOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            middle: MiddleOpt{
                inner: InnerMost{
                    content: 999
                }
            }
        };
    }
}