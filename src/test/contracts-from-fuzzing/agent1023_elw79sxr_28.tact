struct Opcodes {
    msg: MyMessage;
    msgOpt: MyMessage?;
}

message(1234) MyMessage {
    value: Int;
}

contract MessageStructStorage {
    opcodes: Opcodes;

    init() {
        self.opcodes = Opcodes{
            msg: MyMessage{ value: 42 },
            msgOpt: null
        };
    }
}