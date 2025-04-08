struct DefStruct {
    foo: Int = 42;
    bar: Bool?;
    baz: String = "hi";
}

contract ParamDefaults(
    s: DefStruct?
) {}
