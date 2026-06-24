struct MessageData {
    opcode: Int as uint32;
    payload: Cell;
    sender: Address;
    comment: String?;
}

contract TestContract {
    lastMsg: MessageData;

    init() {
        self.lastMsg = MessageData{
            opcode: 1234,
            payload: emptyCell(),
            sender: myAddress(),
            comment: "Hello"
        };
    }
}