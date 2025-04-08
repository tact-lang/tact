struct OptNested {
    inner: OptInner?;
}

struct OptInner {
    x: Int;
    y: Bool;
}

contract OptionalNestedStruct {
    n: OptNested;

    init() {
        self.n = OptNested{ inner: null };
    }
}
