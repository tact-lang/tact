struct InnerData {
    a: Int;
    b: String?;
}

message(9001) OuterMsg {
    info: InnerData;
    flag: Bool;
}

contract NestedMsgStruct {
    param: OuterMsg;

    init() {
        self.param = OuterMsg{
            info: InnerData{ a: 5, b: null },
            flag: true
        };
    }
}