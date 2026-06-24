struct Inner {
    x: Int;
    y: Bool?;
    z: String?;
}

contract NestedOptionalContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            x: 1,
            y: true,
            z: "hi",
        };
    }
}