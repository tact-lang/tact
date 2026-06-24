struct MessageWrapper {
    msg: Msg;
}

message(42) Msg {
    data: Int;
}

contract MessageInStorage {
    val: MessageWrapper = MessageWrapper{ msg: Msg{ data: 5 } };
}