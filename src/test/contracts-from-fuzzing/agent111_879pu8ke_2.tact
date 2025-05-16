struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    inner: Inner;
    message: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ x: 10, y: null },
            message: null
        };
    }
}
