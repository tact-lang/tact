struct OptionInStruct {
    x: Int?;
    y: Bool;
}

contract NestedOptionalStruct {
    s: OptionInStruct = OptionInStruct{
        x: null,
        y: true,
    };
}