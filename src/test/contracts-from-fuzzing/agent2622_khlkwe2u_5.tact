struct OptionalNest {
    maybeVal: Int?;
    maybeStr: String?;
    maybeInner: Inner?;
}

struct Inner {
    value: Int;
}

contract OptionalsTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            maybeVal: null,
            maybeStr: null,
            maybeInner: null
        };
    }
}