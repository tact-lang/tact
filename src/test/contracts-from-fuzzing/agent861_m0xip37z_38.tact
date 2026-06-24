struct InnerBool {
    a: Bool;
}

struct OuterOptBool {
    inner: InnerBool?;
}

contract OptionalStructWithBool {
    s: OuterOptBool?;

    init() {
        self.s = null;
    }
}
