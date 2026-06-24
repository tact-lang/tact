message(1234) InnerMsg {
    val: Int = 5;
}

struct WithMsg {
    m: InnerMsg = InnerMsg{};
}

contract PersistMsgStruct {
    data: WithMsg = WithMsg{};
}