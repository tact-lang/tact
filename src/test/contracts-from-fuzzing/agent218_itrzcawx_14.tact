struct MessageFields {
    op: Int as uint32;
    data: Cell;
}

contract ContainsMessageStruct {
    payload: MessageFields;

    init() {
        self.payload = MessageFields{
            op: 123,
            data: emptyCell()
        };
    }
}