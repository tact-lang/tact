struct OptionalNested {
    foo: Int?;
    bar: String?;
}

contract StructParamOptional(
    o: OptionalNested?,
) {}