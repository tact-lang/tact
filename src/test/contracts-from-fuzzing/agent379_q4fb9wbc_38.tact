struct Inner {
    flag: Bool?;
}

contract OptionalNestedBool {
    f: Inner;

    init() {
        self.f = Inner{ flag: null };
    }
}