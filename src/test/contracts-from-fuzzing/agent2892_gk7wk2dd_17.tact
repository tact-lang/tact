message(1) Msg1 {}
message(2) Msg2 {}

struct MsgHolder {
    m1: Msg1;
    m2: Msg2;
}

contract MessagesInState {
    val: MsgHolder;
    init() {
        self.val = MsgHolder{ m1: Msg1{}, m2: Msg2{} };
    }
}