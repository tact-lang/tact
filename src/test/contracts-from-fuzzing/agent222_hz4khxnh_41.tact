struct S {
    x: Int = 1;
    y: Bool = true;
}

contract ContrParamsNested(
    sfield: S?,
    foo: Int?,
    bar: String,
) {
    receive(){}
}