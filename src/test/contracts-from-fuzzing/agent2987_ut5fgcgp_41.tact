struct OptionalInnerMost {
    z: Int;
}

struct OptionalMiddle {
    inner: OptionalInnerMost?;
    flag: Bool;
}

struct OptionalOuterMost {
    middle: OptionalMiddle?;
    count: Int;
}

contract DeepOptionalNesting {
    data: OptionalOuterMost;

    init() {
        self.data = OptionalOuterMost{
            middle: null,
            count: 123
        };
    }
}
