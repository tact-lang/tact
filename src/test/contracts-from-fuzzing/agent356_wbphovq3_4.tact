struct OptionalNest {
    foo: Int?;
    bar: Bool?;
    nested: Inner?;
}

struct Inner {
    value: Int;
}

contract OptNestTest {
    state: OptionalNest;

    init() {
        self.state = OptionalNest{
            foo: null,
            bar: true,
            nested: null
        };
    }
}