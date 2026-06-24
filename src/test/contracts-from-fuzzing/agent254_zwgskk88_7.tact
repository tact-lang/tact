struct Nested {
    x: Int = 1;
    y: Int? = null;
}
contract ParamTest(
    nested: Nested
) {
    receive() {}
}