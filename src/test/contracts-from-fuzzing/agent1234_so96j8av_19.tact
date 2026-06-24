struct NestedParam {
    a: Int as uint64;
    b: Bool?;
    c: String?;
}

contract ComplexParam(
    foo: NestedParam?,
) {}