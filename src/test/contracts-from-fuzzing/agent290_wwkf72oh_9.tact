struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: OptionalFields = OptionalFields{
        a: null,
        b: true,
        c: null
    };
}
