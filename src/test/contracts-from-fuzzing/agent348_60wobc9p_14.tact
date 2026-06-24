message(888) DeepMsg {
    flag: Bool;
}

struct MidParam {
    num: Int;
    msg: DeepMsg;
}

contract DeepParamContract(
    param: MidParam
) {}