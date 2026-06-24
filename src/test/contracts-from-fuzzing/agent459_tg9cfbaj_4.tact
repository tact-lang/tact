struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: String;
}

contract NestedStructStorage {
    data: Outer = Outer{ inner: Inner{ x: 5, y: true }, z: "abc" };

    init() {
        self.data = Outer{ inner: Inner{ x: 42, y: false }, z: "def" };
    }
}
