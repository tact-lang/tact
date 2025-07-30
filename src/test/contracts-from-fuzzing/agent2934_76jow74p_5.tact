struct WithOptionals {
    a: Int;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract StructWithOptionals {
    f: WithOptionals;

    init() {
        self.f = WithOptionals{
            a: 11,
            b: null,
            c: true,
            d: "optstr",
        };
    }
}