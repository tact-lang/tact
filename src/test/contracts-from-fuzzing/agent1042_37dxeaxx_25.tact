struct MessageStruct {
    id: Int;
}

contract MessageLike {
    msgField: MessageStruct;
    init() {
        self.msgField = MessageStruct{id:123};
    }
}