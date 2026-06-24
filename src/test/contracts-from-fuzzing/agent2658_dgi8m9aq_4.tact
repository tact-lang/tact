struct InnerOpt {
    x: Int?;
}

contract NestedOptionalField {
    val: InnerOpt = InnerOpt{ x: null };
}