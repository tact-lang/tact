message(0x1234) Msg {
    thumbs: Bool;
    note: String?;
}

contract MsgHolder {
    m: Msg? = null;

    init() {}
}