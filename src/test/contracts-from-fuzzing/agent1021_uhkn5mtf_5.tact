struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructField {
    optField: DeeplyOptional = DeeplyOptional{
        a: null,
        b: null,
        c: null,
    };
}