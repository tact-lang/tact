message(99) Note {
    txt: String;
}

struct MsgHolder {
    m: Note?;
}

contract OptMsgInStruct {
    hold: MsgHolder?;

    init() {
        self.hold = MsgHolder{
            m: Note{ txt: "hello" }
        };
    }
}