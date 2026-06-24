struct NestedWithDefaults {
    name: String = "nested";
    number: Int? = null;
}

contract ParamOptionalStruct(
    param: NestedWithDefaults?,
) {
    // test optional struct as parameter, with nested defaults inside
}