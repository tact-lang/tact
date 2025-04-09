struct NestedOptionals {
    innerInt: Int?;
    innerBool: Bool?;
    innerStr: String?;
}

contract OptionalParamStruct(
    nested: NestedOptionals?
) {
}