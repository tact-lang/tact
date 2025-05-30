struct Inner {
    foo: Int?;
    bar: String?;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }

    receive() {
        let _ = self.data.inner;
    }
}