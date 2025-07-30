contract OptionalChain {
    a: Int?;
    b: OptionalInner?;

    init() {
        self.a = null;
        self.b = null;
    }
}

struct OptionalInner {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
}