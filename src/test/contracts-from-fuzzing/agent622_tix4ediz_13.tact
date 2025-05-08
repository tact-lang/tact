struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
    x: Int;
}

contract OptionalStructField {
    data: Outer?;

    init() {
        self.data = null;
    }
}