struct InnerMost {
    x: Int?;
    y: Bool?;
}

struct MiddleOpt {
    innerMost: InnerMost?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract TestContract {
    data: OuterOpt?;

    init() {
        self.data = OuterOpt{
            middle: MiddleOpt{
                innerMost: InnerMost{
                    x: null,
                    y: null
                }
            }
        };
    }
}