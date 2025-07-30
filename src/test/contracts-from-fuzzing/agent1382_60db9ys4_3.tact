struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    name: String;
}

contract NestedStructStorage {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ x: 1, y: false },
            name: "nested"
        };
    }
}
