struct NestedOptions {
    flag: Bool?;
    text: String?;
}

contract ComboFieldsParams(
    val: Int,
    opt1: Int?,
    opt2: Bool?,
    opt3: String?,
    nested: NestedOptions?,
) {
}
