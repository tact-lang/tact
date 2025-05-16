struct OptionalWrap {
    inner: Wrap?;
}

struct Wrap {
    a: Int;
    b: Int?;
}

contract OptionalComplex {
    data: OptionalWrap?;
    init() {
        self.data = null;
    }
}