struct Payload {
    data: Int?;
    flag: Bool;
}

message(0x42) MyMessage {
    content: Payload?;
    number: Int;
}

contract StoreMessage {
    saved: MyMessage = MyMessage{
        content: null,
        number: 7
    };

    init() {
        self.saved = MyMessage{
            content: Payload{
                data: 123,
                flag: true
            },
            number: 77
        };
    }
}