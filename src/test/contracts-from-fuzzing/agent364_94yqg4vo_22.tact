message(42) Msg {
    foo: Int;
    bar: Bool?;
}

contract PersistentMessage {
    msgField: Msg;

    init() {
        self.msgField = Msg{
            foo: 7,
            bar: true
        };
    }
}