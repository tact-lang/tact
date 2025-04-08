struct OptionalBoolInner {
    a: Int;
    b: Bool?;
}

struct OptionalBoolOuter {
    inner: OptionalBoolInner?;
}

contract OptionalBoolWrap {
    val: OptionalBoolOuter;

    init() {
        self.val = OptionalBoolOuter{
            inner: OptionalBoolInner{
                a: 1,
                b: null,
            },
        };
    }
}