struct OptNest {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestContract {
    s: OptNest;

    init() {
        self.s = OptNest{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}
