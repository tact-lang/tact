struct InnerMost {
    val: Int;
}

struct Inner {
    innerMost: InnerMost?;
    flag: Bool;
}

struct Outer {
    maybeInner: Inner?;
    text: String;
}

contract OptionalNest {
    s: Outer;

    init() {
        self.s = Outer{
            maybeInner: null,
            text: "Testing",
        };
    }
}