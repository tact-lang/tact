struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptTester {
    data: OptionalFields = OptionalFields{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null,
    };
}
