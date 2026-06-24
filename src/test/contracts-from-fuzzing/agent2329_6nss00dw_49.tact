struct OptionalInnerMost {
    deepOpt: Int?;
}

struct OptionalMiddle {
    inner: OptionalInnerMost?;
}

contract MultiOptNest {
    val: OptionalMiddle;

    init() {
        self.val = OptionalMiddle{
            inner: null
        };
    }
}
