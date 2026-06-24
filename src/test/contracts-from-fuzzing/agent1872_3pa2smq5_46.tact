// test when persistent field type is a message struct
message(1) MsgType {
    x: Int;
    flag: Bool;
}

contract PersistMessageField {
    m: MsgType;
    init() {
        self.m = MsgType{x: 42, flag: true};
    }
}