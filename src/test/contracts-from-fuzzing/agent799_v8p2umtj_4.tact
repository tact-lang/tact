struct OptNested {
    foo: Int?;
    bar: Bool?;
}

contract OptionalNestedStorage {
    optNest: OptNested? = null;

    init() {
        self.optNest = OptNested{
            foo: 7,
            bar: false,
        };
    }
}