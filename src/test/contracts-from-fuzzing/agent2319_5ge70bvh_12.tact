struct Inner {
    foo: Int?;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{
            inner: Inner{
                foo: null,
            },
        };
    }
}
