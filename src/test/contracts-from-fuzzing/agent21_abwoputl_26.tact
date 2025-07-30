struct InnerParam {
    val: Int;
}

struct ParamContainer {
    inner: InnerParam;
    flag: Bool;
}

contract ParamDeep(
    p: ParamContainer
) {}
