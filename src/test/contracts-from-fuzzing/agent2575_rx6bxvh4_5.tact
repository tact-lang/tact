struct OptionalFields {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    opts: OptionalFields = OptionalFields{
        foo: null,
        bar: true
    };
}