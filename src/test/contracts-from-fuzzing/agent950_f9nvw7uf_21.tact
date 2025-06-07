struct NestedDefaults {
    foo: Int = 10;
    bar: Bool?;
}

contract NestedParam(
    data: NestedDefaults?
) {}