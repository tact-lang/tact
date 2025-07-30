struct OptionalWrap {
    a: Int?;
    b: Bool?;
}

struct NestedWrap {
    inner: OptionalWrap?;
}

contract ManyNulls {
    f: NestedWrap?;

    init() {
        self.f = null;
    }
}