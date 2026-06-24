struct OptionalStruct {
    optInt: Int?;
    optStr: String?;
}

contract OptVars {
    os: OptionalStruct = OptionalStruct{
        optInt: null,
        optStr: null
    };
}
