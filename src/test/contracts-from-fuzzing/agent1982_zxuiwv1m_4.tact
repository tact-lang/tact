struct OptNested {
    opt1: Int?;
    opt2: Nested?;
}

struct Nested {
    a: Int;
    b: Int;
}

contract OptionalNest {
    store: OptNested;

    init() {
        self.store = OptNested{
            opt1: null,
            opt2: null
        };
    }
}