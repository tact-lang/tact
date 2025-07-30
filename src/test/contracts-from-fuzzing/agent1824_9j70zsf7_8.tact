struct OptionalInner {
    flag: Bool?;
    text: String?;
}

struct OptionalMiddle {
    inner: OptionalInner?;
}

contract OptionalsInNestedStructs {
    data: OptionalMiddle;

    init() {
        self.data = OptionalMiddle{
            inner: null
        };
    }
}
