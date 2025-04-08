struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    inner: Inner;
    msg: String;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{ inner: Inner{ foo: 123, bar: null }, msg: "hello" };
    }
}