message(42) Note {
    msg: String;
    num: Int;
}

contract MsgStructPersist {
    note: Note;

    init() {
        self.note = Note{
            msg: "hi",
            num: 5,
        };
    }

    receive() {
        let _ = self.note.num;
    }
}
