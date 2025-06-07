struct MessagePayload {
    amount: Int as uint32;
    flag: Bool;
}

message(0x1234abcd) MyMessage {
    data: MessagePayload;
}

contract TestContract {
    m: MyMessage;

    init() {
        self.m = MyMessage{ data: MessagePayload{ amount: 42, flag: true } };
    }
}