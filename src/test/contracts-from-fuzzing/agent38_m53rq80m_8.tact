message ManyFieldsMsg {
    F1: Int;
    F2: Int;
    F3: Int;
    F4: Int;
    F5: Int;
    F6: Int;
    F7: Int;
    F8: Int;
    F9: Int;
    F10: Int;
    F11: Int;
    F12: Int;
    F13: Int;
    F14: Int;
    F15: Int;
}

contract TestManyFields {
    receive(msg: ManyFieldsMsg) {
        let s = msg.F1 + msg.F2 + msg.F3;
    }
}
