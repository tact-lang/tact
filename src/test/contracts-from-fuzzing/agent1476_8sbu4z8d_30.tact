struct Inner {
    message: String?;
}

struct Outer {
    inner: Inner?;
}

contract OptNestedStr {
    prop: Outer;

    init() {
        self.prop = Outer{
            inner: Inner{
                message: null,
            }
        };
    }
}