struct WithOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Cell?;
}

contract OptionalFields {
    s: WithOptionals;

    init() {
        self.s = WithOptionals{
            foo: null,
            bar: true,
            baz: "ok",
            qux: null,
        };
    }
}