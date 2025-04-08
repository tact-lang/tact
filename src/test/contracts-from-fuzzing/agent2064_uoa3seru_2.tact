struct NestedStruct {
    flag: Bool;
    count: Int;
    message: String;
}

contract DeepContract {
    nested: NestedStruct = NestedStruct{
        flag: false,
        count: 0,
        message: "",
    };
}
