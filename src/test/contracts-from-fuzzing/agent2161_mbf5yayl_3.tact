struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    value: Int;
}

contract OptNestedContract {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{ inner: null };
    }
}