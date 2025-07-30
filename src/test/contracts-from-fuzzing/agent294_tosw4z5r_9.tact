message(2) Ping {
    x: Int;
}

contract OptionalMsgField {
    data: Ping?;

    init() {
        self.data = null;
    }
}
