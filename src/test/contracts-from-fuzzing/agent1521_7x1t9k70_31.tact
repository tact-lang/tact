message(11) MsgInOpt {
    num: Int;
}

struct Container {
    inner: MsgInOpt?;
}

contract NestedParamOpt(
    param: Container?,
) {}
