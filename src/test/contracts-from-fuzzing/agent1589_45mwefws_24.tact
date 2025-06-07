message(1) InnerMsg {
    opt: Int?;
}

message(2) OuterMsg {
    inner: InnerMsg;
    flag: Bool?;
}

contract MsgFieldTest {
    data: OuterMsg;

    init() {
        self.data = OuterMsg{ inner: InnerMsg{ opt:null }, flag:null };
    }
}