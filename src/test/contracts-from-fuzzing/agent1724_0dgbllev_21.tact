struct Inner {
    a: Int;
}

struct Outer {
    ref: Inner?;
}

contract OptionalStructRef {
    data: Outer?;

    init() {
        self.data = null;
    }
}