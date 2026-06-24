struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner;
    bar: Int?;
    val: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ foo: 42 },
            bar: null,
            val: 7
        };
    }
}