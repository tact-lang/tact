struct Inner {
    foo: Int;
}

contract ParamState(
    data: Inner,
    flag: Bool,
    txt: String?
) {
    receive() {}
}