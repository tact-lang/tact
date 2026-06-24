struct Message {
    sender: Address;
    text: String;
    stamp: Int;
}

contract LargeNest {
    val: Message;

    init() {
        self.val = Message{
            sender: myAddress(),
            text: "hello",
            stamp: 12345
        };
    }
}