// contract parameters + struct inside param list
struct ParamS {
    f: Bool;
    g: Int?;
}

contract ParamWithStruct(
    a: Int,
    b: Bool?,
    c: String?,
    d: ParamS
) {
    receive() {}
}