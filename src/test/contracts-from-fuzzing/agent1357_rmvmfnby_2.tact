struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner?;
    count: Int;
}

contract Test {
    state: Outer = Outer{
        inner: null,
        count: 0,
    };

    init() {
        self.state = Outer{
            inner: null,
            count: 0,
        };
    }
}