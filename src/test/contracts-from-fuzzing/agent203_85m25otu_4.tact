struct OptionalNest {
    nested: Inner?;
}

struct Inner {
    x: Int;
}

contract TestContract {
    value: OptionalNest;

    init() {
        self.value = OptionalNest{
            nested: Inner{
                x: 99,
            },
        };
    }
}