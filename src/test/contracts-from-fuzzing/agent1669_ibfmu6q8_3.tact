struct Inner {
    x: Int = 1;
    y: Bool = true;
}

struct Outer {
    inner: Inner;
    msg: String?;
}

contract NestedOptionalFields {
    state1: Int?;
    state2: Outer;

    init() {
        self.state1 = null;
        self.state2 = Outer{
            inner: Inner{ x: 10, y: false },
            msg: "hello",
        };
    }
}