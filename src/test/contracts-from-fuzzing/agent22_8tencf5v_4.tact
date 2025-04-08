struct OptionalNested {
    maybeInner: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract OptionalNestContract {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            maybeInner: null
        };
    }
}
