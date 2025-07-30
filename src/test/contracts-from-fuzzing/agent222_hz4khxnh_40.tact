struct StrBoolInt {
    si: Int;
    sb: Bool;
    ss: String;
}

contract ContrParamsStruct(
    arg: StrBoolInt,
    foo: Int?,
    bar: String?,
    baz: Bool?,
) {
    receive(){}
}