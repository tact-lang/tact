struct Inner {
    x: Int;
}

struct Wrapper {
    a: Inner;
}

contract OptionalNestedStructField {
    optWrap: Wrapper?;

    init() {
        self.optWrap = Wrapper{
            a: Inner{x: 123}
        };
    }
}
