message(0x55) OptionalInMessage {
    foo: Int?;
    bar: Bool? = null;
}

contract MsgOptDefaults {
    data: OptionalInMessage;

    init() {
        self.data = OptionalInMessage{ foo: null };
    }
}