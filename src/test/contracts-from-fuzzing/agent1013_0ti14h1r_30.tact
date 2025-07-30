struct Middle {
    x: Int;
    y: String;
}

contract OptionalNested {
    inner: Middle?;

    init() {
        self.inner = null;
    }
}