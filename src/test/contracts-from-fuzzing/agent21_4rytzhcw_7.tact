struct Inner {
    foo: Int?;
}

struct Outer {
    inner: Inner?;
}

contract NestedOptionals {
    data: Outer?;

    init() {
        self.data = Outer{
            inner: Inner{
                foo: null
            }
        };
    }
}
