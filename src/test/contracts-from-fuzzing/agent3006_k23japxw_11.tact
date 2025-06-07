struct Inner {
    val: Int;
    opt: Bool?;
}

struct Outer {
    s: String;
    inner: Inner;
    flag: Bool;
}

contract OptionalOuter {
    maybe: Outer?;

    init() {
        self.maybe = null;
    }
}
