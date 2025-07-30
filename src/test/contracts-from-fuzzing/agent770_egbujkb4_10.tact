struct MessageInner {
    id: Int;
    status: String;
}
contract OptionalInStruct {
    msgData: MessageInner?;

    init() {
        self.msgData = null;
    }
}
