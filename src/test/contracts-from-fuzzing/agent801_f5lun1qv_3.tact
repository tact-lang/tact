struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract OptionalFieldsContract {
    opts: WithOptionals;

    init() {
        self.opts = WithOptionals{
            a: null,
            b: true,
            c: 42,
            d: null
        };
    }
}