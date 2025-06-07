struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
    optional: Inner1?;
}

contract OptionalInner {
    inner: Inner2;

    init() {
        self.inner = Inner2{
            b: 123,
            optional: null
        };
    }
}