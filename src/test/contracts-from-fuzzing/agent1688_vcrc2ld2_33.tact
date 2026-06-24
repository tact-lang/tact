message(777) MsgOpt {
    count: Int;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    data: MsgOpt;
    init() {
        self.data = MsgOpt{count:5, flag:null, text:"hi"};
    }
}