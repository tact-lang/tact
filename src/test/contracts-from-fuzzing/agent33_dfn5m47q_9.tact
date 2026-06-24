struct MessageData {
    content: Slice;
    timestamp: Int as uint64;
    sender: Address;
    isRead: Bool;
    hasAttachments: Bool;
    replyToMessageId: Int?;
}

contract Inbox {
    message: MessageData;

    init() {
        self.message = MessageData{
            content: emptyCell().asSlice(),
            timestamp: 0,
            sender: myAddress(),
            isRead: false,
            hasAttachments: false,
            replyToMessageId: null
        };
    }
}