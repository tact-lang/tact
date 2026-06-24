message(0x999) InfoMsg {
    title: String?;
    desc: String?;
    code: Int;
}

struct InfoWrap {
    msg: InfoMsg;
    flag: Bool;
}

contract OptMsgNested {
    info: InfoWrap;

    init() {
        self.info = InfoWrap{
            msg: InfoMsg{
                title: null,
                desc: null,
                code: 500
            },
            flag: true
        };
    }

    receive() {
        self.info = self.info;
    }
}