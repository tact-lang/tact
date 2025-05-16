struct Outer {
    inner: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{ foo: 17, bar: true }
        };
    }
}