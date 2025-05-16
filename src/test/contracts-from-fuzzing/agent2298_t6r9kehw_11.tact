struct OptionalInner {
    x: Int?;
    y: String?;
    z: Bool?;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract NullableNested {
    n: OptionalOuter;

    init() {
        self.n = OptionalOuter{
            inner: null
        };
    }
}