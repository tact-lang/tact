struct InnerOpt {
    d: Int?;
}

struct MiddleOpt {
    mid: InnerOpt?;
}

contract OptionalInOptional {
    data: MiddleOpt;

    init() {
        self.data = MiddleOpt{
            mid: null
        };
    }
}