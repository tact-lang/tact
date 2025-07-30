// contract parameters with optional struct param
struct InnerParam {
    x: Int;
}

contract OptParam(
    ip: InnerParam?,
    tag: String?,
    flag: Bool?,
) {}