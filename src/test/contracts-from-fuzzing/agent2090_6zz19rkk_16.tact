struct Inner {
    x: Int;
    y: String?;
}

message(100) ComplexMessage {
    val: Inner?;
    label: String;
}

contract OptMsgOptStruct {
    msgVal: ComplexMessage?;

    init() {
        self.msgVal = ComplexMessage{
            val: null,
            label: "hi"
        };
    }
}