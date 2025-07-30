struct NullableField {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ComplexNullables {
    nf: NullableField = NullableField{
        a: null,
        b: null,
        c: null,
    };
}