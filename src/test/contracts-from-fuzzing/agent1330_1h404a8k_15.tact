struct InnerData {
    foo: Int;
}

contract OptStructParam(
    inner: InnerData?,
) {
    receive() {}
}
