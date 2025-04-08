struct InnerOpt {
    x: Int?;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract DeeplyOptional {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            middle: MiddleOpt{
                inner: null
            }
        };
    }
}