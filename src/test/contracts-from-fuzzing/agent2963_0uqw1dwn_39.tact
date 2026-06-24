struct NestedOptionalParams {
    x: Int; y: Bool;
}

contract ParamOptStruct(
    s: NestedOptionalParams?,
    i: Int?,
    b: Bool?,
    t: String?
) {}
