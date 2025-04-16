struct NestedParam {
    foo: Int;
    bar: Bool;
}

contract ParamContract(
    a: Int,
    b: String,
    c: NestedParam?,
) {}