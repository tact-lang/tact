struct NestedParam {
    f1: Int;
    f2: Bool?;
    f3: String?;
}

contract NestedStructParam(
    st: NestedParam,
    y: Int,
) {
    receive() {}
}