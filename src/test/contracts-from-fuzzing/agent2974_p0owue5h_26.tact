// contract param list with nested struct param
struct InnerParam {
    val: Int;
    flag: Bool;
}

contract Test(
    ip: InnerParam,
    extra: Bool
) {}