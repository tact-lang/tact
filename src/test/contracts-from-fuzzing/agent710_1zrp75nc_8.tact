struct OptionalAll {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Builder?;
    f: Address?;
}

contract OptionalFieldsTest {
    value: OptionalAll = OptionalAll{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null,
    };
}