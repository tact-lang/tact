struct OptionalNested {
    maybeInner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalDeep {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{
            maybeInner: null
        };
    }
}