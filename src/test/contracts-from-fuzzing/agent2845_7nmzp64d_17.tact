struct MessageExample {
    amount: Int;
}

message DummyMessage {
    m: MessageExample;
}

contract MessageInStorage {
    data: MessageExample;

    init() {
        self.data = MessageExample{ amount: 777 };
    }
}