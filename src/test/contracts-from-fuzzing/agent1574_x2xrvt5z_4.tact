struct WithOptional {
    a: Int;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptionalFields {
    field: WithOptional;

    init() {
        self.field = WithOptional{
            a: 7,
            b: null,
            c: null,
            d: null
        };
    }
}