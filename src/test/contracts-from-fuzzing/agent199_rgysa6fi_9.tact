struct MessageHolder {
    m: MessageWithOpcode;
}

message(0xABCD1234) MessageWithOpcode {
    number: Int;
    flag: Bool;
}

contract MessageAsField {
    msgData: MessageHolder;

    init() {
        self.msgData = MessageHolder{
            m: MessageWithOpcode{
                number: 5,
                flag: true,
            },
        };
    }
}
