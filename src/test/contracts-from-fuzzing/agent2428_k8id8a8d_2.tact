struct Inner {
    flag: Bool?;
    value: Int?;
}

struct Outer {
    inner: Inner;
    number: Int;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{ flag: null, value: null },
            number: 42
        };
    }
}