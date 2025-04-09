struct OptionalNestedOptional {
    maybeInner: Inner?;
}

struct Inner {
    foo: Int?;
}

contract TestContract {
    item: OptionalNestedOptional;

    init() {
        self.item = OptionalNestedOptional{
            maybeInner: Inner{
                foo: null
            }
        };
    }
}