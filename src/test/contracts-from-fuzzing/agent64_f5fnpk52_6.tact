struct OptInner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalNestedStruct {
    inner: OptInner?;

    init() {
        self.inner = OptInner{
            x: 1,
            y: true,
            z: "hello"
        };
    }

    receive() {
        self.inner = null;
    }
}