struct MessageHeader {
    id: Int as uint32;
    payload: String;
}

struct MessageBody {
    data: String;
    timestamp: Int;
}

struct FullMessage {
    header: MessageHeader;
    body: MessageBody;
}

contract MessagesContract {
    message: FullMessage;

    init() {
        self.message = FullMessage{
            header: MessageHeader{ id: 42, payload: "header" },
            body: MessageBody{ data:"body", timestamp:123456 } 
        };
    }
}