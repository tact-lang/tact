struct Nested {
    foo: Int?;
    bar: Bool = false;
}

contract Test(
    id: Int,
    nest: Nested?,
) {}