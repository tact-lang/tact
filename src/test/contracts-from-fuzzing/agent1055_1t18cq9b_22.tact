message(100) InnMsg1 { text: String }
message(200) InnMsg2 { num: Int }

struct OptMsgStruct {
    a: InnMsg1?;
    b: InnMsg2?;
    flag: Bool;
}

contract OptionalNestedMsgs {
    data: OptMsgStruct;

    init() {
        self.data = OptMsgStruct{
            a: null,
            b: null,
            flag: true,
        };
    }
}