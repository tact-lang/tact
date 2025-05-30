struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    first: Int;
    inner: Inner;
    second: String;
}

contract Layered {
    data: Outer;

    init() {
        self.data = Outer{
            first: 7,
            inner: Inner{ x: 42, y: true },
            second: "hello"
        };
    }
}