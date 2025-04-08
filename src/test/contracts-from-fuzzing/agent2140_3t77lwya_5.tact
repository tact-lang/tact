struct OptionalNested {
    maybeInner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptNestedContract {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{ maybeInner: null };
    }
}
