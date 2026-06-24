message(99) Note {
    txt: String;
}

struct MsgHolder {
    m: Note?;
}

contract NullOptMsgInStruct {
    hold: MsgHolder?;

    init() {
        self.hold = null;
    }
}