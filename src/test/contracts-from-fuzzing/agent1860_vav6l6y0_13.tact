struct EmptyOptFields {
    a: Int?;
    b: Bool?;
}

contract InitNullDefaults {
    data: EmptyOptFields = EmptyOptFields{
        a: null,
        b: null
    };
}