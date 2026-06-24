message(0x42) Note {
    content: String;
    author: Address;
}

struct MessageWrap {
    note: Note;
    id: Int;
}

contract MessageStructPersist {
    wrapper: MessageWrap;

    init() {
        self.wrapper = MessageWrap{
            note: Note{ content: "Msg", author: myAddress() },
            id: 11,
        };
    }
}