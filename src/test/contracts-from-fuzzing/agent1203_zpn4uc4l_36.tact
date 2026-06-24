message(0x42) SpecialMessage {
    number: Int;
}

contract MsgFieldInState {
    stored: SpecialMessage;

    init() {
        self.stored = SpecialMessage{number: 123};
    }
}