struct MessageHolder {
    m1: Msg1;
    m2: Msg2;
}

message(1) Msg1 {
    a: Int;
}

message(2) Msg2 {
    b: Bool;
}

contract StructWithMessages {
    mh: MessageHolder;
    init() {
        self.mh = MessageHolder{
            m1: Msg1{a:10},
            m2: Msg2{b:true},
        };
    }
}