struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract Test2 {
    inner: Inner;

    init() {
        self.inner = Inner{ x: 5, y: true, z: "hello" };
    }
}