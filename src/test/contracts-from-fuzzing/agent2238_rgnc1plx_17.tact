struct Message {
    body: String;
}

contract Messenger {
    m1: Message;
    m2: Message;

    init() {
        self.m1 = Message{body: "hello"};
        self.m2 = Message{body: "world"};
    }
}
