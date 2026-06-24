struct NestedWithOptionals {
    a: Int?;
    inner: Inner?
}

struct Inner {
    x: Int;
    y: Int;
}

contract OptionalNestedCombo {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            a: null,
            inner: null,
        };
    }
}