struct DefaultsStruct {
    foo: Int;
    bar: String;
}

contract StructDefaults {
    s: DefaultsStruct = DefaultsStruct{ foo: 99, bar: "hey" };
}
