message(123456) MsgType {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    msgdata: MsgType;

    init() {
        self.msgdata = MsgType{foo:42, bar:true};
    }
}