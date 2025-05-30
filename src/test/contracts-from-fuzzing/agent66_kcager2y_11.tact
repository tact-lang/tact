struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptFieldsTest {
    opt: OptionalFields = OptionalFields{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null
    };
}