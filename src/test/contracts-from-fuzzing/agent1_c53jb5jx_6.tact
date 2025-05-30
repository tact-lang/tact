message DataMessage {
    data: Int as uint32;
}

contract Receiver {
    value: Int as uint32;

    init() {
        self.value = 0;
    }

    receive(msg: DataMessage) {
        self.value = msg.data; // Access the message field
    }
}