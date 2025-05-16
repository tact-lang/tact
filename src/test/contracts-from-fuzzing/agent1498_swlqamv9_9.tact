message(42) MsgData {
    f: Int;
    b: Bool;
    s: String?;
}

contract MessageHolder {
    stored: MsgData;

    init() {
        self.stored = MsgData{ f: 123, b: true, s: null };
    }
}