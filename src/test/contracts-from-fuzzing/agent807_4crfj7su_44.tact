// test message with optional nested message
message(101) InnerMsg {}

message(102) OuterMsgOpt {
    nested: InnerMsg?;
}

contract MessageOptNested {
    m: OuterMsgOpt;
    init() {
        self.m = OuterMsgOpt{ nested: null };
    }
}