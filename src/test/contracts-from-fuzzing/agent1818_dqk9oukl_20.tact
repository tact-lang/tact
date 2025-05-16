struct MessageHolder {
    msg: MsgType;
}

message(1) MsgType {
    a: Int;
    b: Bool;
    c: String;
}

contract MessageFieldTest {
    val: MessageHolder;

    init() {
        self.val = MessageHolder{
            msg: MsgType{a:5,b:true,c:"hi"}
        };
    }
}
