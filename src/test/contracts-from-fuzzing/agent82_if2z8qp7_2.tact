struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: String;
}

contract Test {
    field: Outer;

    init() {
        self.field = Outer{
            inner: Inner{ x: 123, y: true },
            z: "abc"
        };
    }
}