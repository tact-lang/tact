struct Nested {
    foo: Int?;
    bar: Bool;
}

contract ParamsContract(
    x: Int,
    y: Bool,
    nested: Nested,
) {}