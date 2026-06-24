struct Internal {
    x: Int?;
}

message OuterMsg {
    f: Internal?;
}

contract OptMsgWithStruct {
    data: OuterMsg?;

    init() {
        self.data = null;
    }
}