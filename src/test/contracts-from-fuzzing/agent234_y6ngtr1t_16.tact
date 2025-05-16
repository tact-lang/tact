struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

struct OptionalOuter {
    baz: OptionalInner?;
}

contract OptWrap {
    state: OptionalOuter;

    init() {
        self.state = OptionalOuter{baz: null};
    }
}