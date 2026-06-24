message(1) MsgData {
    content: String;
}

contract MessageInStorage {
    val: MsgData;

    init() {
        self.val = MsgData{ content: "hi" };
    }
}