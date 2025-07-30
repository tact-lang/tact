struct Deep {
    foo: Int;
    bar: Bool;
}

contract ParamsContract(
    a: Int,
    optB: Bool?,
    nested: Deep,
    optNested: Deep?
) {
    receive() {}
}
