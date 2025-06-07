struct OptionAndPrimitive {
    flag: Bool;
    optStr: String?;
    optInt: Int?;
    optAddr: Address?;
}

contract OptionalMixedFields {
    f: OptionAndPrimitive = OptionAndPrimitive{
        flag: true,
        optStr: null,
        optInt: null,
        optAddr: null
    };
}