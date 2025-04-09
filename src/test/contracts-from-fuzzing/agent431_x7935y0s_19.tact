struct DeepNestedOptional {
    q: Int?;
    s: String?;
}

contract OptNestedParam(
    foo: Int,
    nested: DeepNestedOptional?,
) {
    receive() {}
}