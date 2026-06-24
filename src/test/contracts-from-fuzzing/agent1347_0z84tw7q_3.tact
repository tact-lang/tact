struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner?;
    count: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            count: 42
        };
    }
}