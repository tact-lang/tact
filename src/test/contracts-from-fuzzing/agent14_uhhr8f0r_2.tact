struct Inner {
    x: Int;
    y: String;
    z: Bool?;
}

contract Test {
    inner: Inner;

    init() {
        self.inner = Inner{
            x: 42,
            y: "hi",
            z: null,
        };
    }
}