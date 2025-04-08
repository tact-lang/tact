struct MessageLike {
    header: Int as uint32;
    id: Int;
    body: Cell;
}

contract MessageStructStorage {
    messageField: MessageLike;

    init() {
        self.messageField = MessageLike{
            header: 0xABCD1234,
            id: 5,
            body: emptyCell()
        };
    }
}