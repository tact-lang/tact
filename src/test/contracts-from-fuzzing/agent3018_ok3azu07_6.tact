struct OptionStruct {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract OptionalStorage {
    optData: OptionStruct = OptionStruct{
        foo: null,
        bar: null,
        baz: true,
    };
}
