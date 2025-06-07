struct NestedOpt {
    f1: Int?;
    f2: NestedInner?;
}

struct NestedInner {
    s: String?;
    b: Bool?;
}

contract OptionalNestedStructContract {
    complex: NestedOpt;

    init() {
        self.complex = NestedOpt{
            f1: null,
            f2: NestedInner{ s: null, b: true }
        };
    }
}