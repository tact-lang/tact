message(0x42) MsgWithField { f: Int }

contract ContractWithMsgField {
    m: MsgWithField;

    init() {
        self.m = MsgWithField{ f:17 };
    }
}