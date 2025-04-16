struct Inner {
    val: Int;
}

struct Outer {
    a: Int;
    inner: Inner?;
}

contract NullNestedOptional {
    data: Outer;

    init() {
        self.data = Outer{
            a: 42,
            inner: null
        };
    }
}
