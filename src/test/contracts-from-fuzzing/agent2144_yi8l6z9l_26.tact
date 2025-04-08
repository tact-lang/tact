struct DStruct {
    foo: String;
    bar: Int;
}

contract DefValNested {
    s: DStruct = DStruct{ foo: "bar", bar: 42 };
}
