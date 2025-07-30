struct Inner {
    x: Int = 123;
    y: String;
}

struct Outer {
    inner: Inner;
    z: Bool = false;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ y: "abc" } };
    }
}