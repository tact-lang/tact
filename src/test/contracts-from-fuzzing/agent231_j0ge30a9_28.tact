message Msg {
    code: Int;
}

struct WrapMsg {
    m: Msg?;
}

contract OptStructWithMsg {
    data: WrapMsg? = null;
}