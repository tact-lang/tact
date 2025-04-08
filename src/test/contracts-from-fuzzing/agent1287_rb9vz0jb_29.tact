// Contract param with nested optionals inside struct
struct NestedOptStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract ParamOpt(
    data: NestedOptStruct?
) {
    get fun dummy(): Int { return 1; }
}