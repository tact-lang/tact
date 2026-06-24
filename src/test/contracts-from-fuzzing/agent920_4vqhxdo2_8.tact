struct OptionalNested {
    foo: Inner?;
}

struct Inner {
    bar: Bool;
}

contract TestContract {
    field: OptionalNested;

    init() {
        self.field = OptionalNested {
            foo: Inner { bar: false }
        };
    }
}