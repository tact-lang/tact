struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner?;
}

contract DoubleOpt {
    data: Outer? = null;

    init() {
        self.data = Outer{
            inner: Inner{ foo: 123 }
        };
    }
}