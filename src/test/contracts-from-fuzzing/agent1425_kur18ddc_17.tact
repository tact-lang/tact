message(0xABCD1234) Payload {
    info: String;
    count: Int;
}

contract MsgStorage {
    data: Payload;

    init() {
        self.data = Payload{
            info: "payload",
            count: 42
        };
    }

    receive() {}
}