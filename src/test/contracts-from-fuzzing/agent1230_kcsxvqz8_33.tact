struct Inner {
    x: Int;
    y: Int;
    z: Int;
}

contract OptionalInner {
    f: Inner?;

    init() {
        self.f = null;
    }
}