struct MidLevel {
    x: Int;
    y: Bool?;
    s: String?;
}

contract OptionalMid {
    inner: MidLevel?;

    init() {
        self.inner = null;
    }
}