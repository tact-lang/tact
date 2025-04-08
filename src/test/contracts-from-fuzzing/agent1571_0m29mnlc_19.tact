struct MessageText {
    content: String = "default";
}

contract TestContract {
    msg: MessageText = MessageText{};

    init() {
        self.msg = MessageText{
            content: "line1\nline2\nline3"
        };
    }
}