message(10) MessageA {}
message(20) MessageB {}

struct MixMsgStruct {
    a: MessageA;
    b: MessageB?;
    flag: Bool;
    val: Int?;
}

contract MsgMixContract {
    data: MixMsgStruct;

    init() {
        self.data = MixMsgStruct{
            a: MessageA{},
            b: null,
            flag: true,
            val: null
        };
    }
}
