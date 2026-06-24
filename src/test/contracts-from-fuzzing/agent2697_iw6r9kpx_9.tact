struct InnerStruct {
    x: Int;
    y: Int;
}

contract Defaults {
    field: InnerStruct = InnerStruct{
        x: 12,
        y: 34,
    };
}
