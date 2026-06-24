struct MsgData {
    ok: Bool;
    comment: String;
}

message(0x42) MessageWithStruct {
    structField: MsgData;
}

contract TestContract {
    msgData: MessageWithStruct;

    init() {
        self.msgData = MessageWithStruct{
            structField: MsgData{
                ok: true,
                comment: "hello",
            },
        };
    }

    receive() {
        let _ = self.msgData.structField.ok;
    }
}