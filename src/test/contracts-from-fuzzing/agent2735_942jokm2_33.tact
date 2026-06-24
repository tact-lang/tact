message(10) SubMsg {
    foo: Int;
    bar: String;
}

message(20) TopMsg {
    sub: SubMsg?;
    flag: Bool;
    num: Int;
}

contract NestedMsgOpt {
    m: TopMsg;

    init() {
        self.m = TopMsg{
            sub: null,
            flag: true,
            num: 123,
        };
    }
}
