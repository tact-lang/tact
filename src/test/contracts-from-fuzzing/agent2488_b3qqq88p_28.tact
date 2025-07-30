message(0xABCD) Msg {
    x: Int;
}

contract MessageInStorage {
    stored: Msg;

    init() {
        self.stored = Msg {
            x: 10
        };
    }
}