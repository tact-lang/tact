struct InnerMost {
    text: String?;
}

struct MiddleLevel {
    value: Int;
    inner: InnerMost?;
}

struct OuterMost {
    flag: Bool;
    mid: MiddleLevel?;
}

contract DeepOptionalNesting {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            flag: true,
            mid: null,
        };
    }
}