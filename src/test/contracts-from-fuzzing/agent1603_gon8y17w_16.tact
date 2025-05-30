struct OptionalInner {
    flag: Bool?;
}
struct OptionalMiddle {
    inner: OptionalInner?;
}

contract DeepOptionals {
    field: OptionalMiddle;

    init() {
        self.field = OptionalMiddle{
            inner: OptionalInner{ flag: null }
        };
    }
}