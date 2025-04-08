struct DeepOptionalInner {
    a: Int?;
    b: Bool?;
}

struct DeepOptionalOuter {
    inner: DeepOptionalInner?;
    s: String?;
}

contract OptNested {
    data: DeepOptionalOuter;

    init() {
        self.data = DeepOptionalOuter {
            inner: null,
            s: null,
        };
    }
}