struct EmbedMsg {
    f: InnerMsg;
}

message(42) InnerMsg {
    val: Int;
}

contract EmbedMsgContract {
    e: EmbedMsg;

    init() {
        self.e = EmbedMsg{f: InnerMsg{val:7}};
    }
}