message(0x55) MyMsg { z: Int; }

struct InnerMsgWrap {
    m: MyMsg;
    s: String;
}

contract WrapMsgInsideStruct {
    inner: InnerMsgWrap;

    init() {
        self.inner = InnerMsgWrap{
            m: MyMsg{ z: 123 },
            s: "hi"
        };
    }
}