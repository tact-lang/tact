struct MessageInner {
    content: String;
}

message Note {
    inner: MessageInner;
}

contract MessageField {
    msgField: Note;

    init() {
        self.msgField = Note{
            inner: MessageInner{ content: "hi" }
        };
    }
}
