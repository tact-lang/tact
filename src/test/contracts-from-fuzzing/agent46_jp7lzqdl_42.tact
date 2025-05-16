message(0x45) InnerMsg { v: Int }

struct HasInnerMsg {
    m: InnerMsg;
}

contract MsgInStruct {
    data: HasInnerMsg;

    init() {
        self.data = HasInnerMsg{ m: InnerMsg{ v: 5 } };
    }
}
