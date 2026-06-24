struct Inner {
    flag: Bool;
    num: Int?;
    text: String;
}

struct Outer {
    inner: Inner;
    maybeInner: Inner?;
}

contract OptionalStructFields {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{ flag: true, num: 42, text: "x" },
            maybeInner: null
        };
    }
}