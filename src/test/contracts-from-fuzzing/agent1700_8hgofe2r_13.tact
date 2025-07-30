struct OptNest {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestContract {
    nested: OptNest;

    init() {
        self.nested = OptNest{
            foo: null,
            bar: false,
            baz: "hi"
        };
    }
}