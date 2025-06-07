message(1) MsgData {
    val: Int;
}

struct Box {
    inner: MsgData?;
}

contract NestedOptionalMessage {
    optBox: Box;

    init() {
        self.optBox = Box{ inner: null };
    }
}