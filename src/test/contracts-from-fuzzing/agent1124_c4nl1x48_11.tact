struct ComplexOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexOptionalStorage {
    s: ComplexOptional = ComplexOptional{
        a: null, b: null, c: null, d: null, e: null, f: null
    };
}