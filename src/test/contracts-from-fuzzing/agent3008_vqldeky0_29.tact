struct MessageData {
    x: Int;
    y: String;
}

contract MessageStorage {
    payload: MessageData;

    init() {
        self.payload = MessageData{
            x: 8,
            y: "payload",
        };
    }
}