struct Inner {
    a: Int;
}
struct OuterOptional {
    inner: Inner?;
    b: Int;
}

contract OptionalStructField {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            inner: null,
            b: 42
        };
    }
}