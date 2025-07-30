struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    msg: String;
    flag: Bool;
}

contract NestedStructs {
    st: Outer;

    init() {
        self.st = Outer{
            inner: Inner{ x: 1, y: true },
            msg: "hello",
            flag: false,
        };
    }
}
