struct OptionalInner {
    a: Int?;
    b: Bool?;
}

struct OptionalOuter {
    inner1: OptionalInner?;
    inner2: OptionalInner?;
}

contract OptionalMany {
    state: OptionalOuter = OptionalOuter {
        inner1: OptionalInner { a: 1, b: false },
        inner2: null
    };
    result: Int = 0;

    init() {
        self.result = self.state.inner1!!.a!! + 10;
    }
}
