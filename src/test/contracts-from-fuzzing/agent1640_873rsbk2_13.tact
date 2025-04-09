message(100) NoteMsg {
    txt: String;
}

struct MaybeMsgWrap {
    note: NoteMsg?;
    count: Int;
}

contract OptionalCombo {
    data: MaybeMsgWrap?;

    init() {
        self.data = MaybeMsgWrap{
            note: NoteMsg{txt: "hi"},
            count: 7
        };
    }
}