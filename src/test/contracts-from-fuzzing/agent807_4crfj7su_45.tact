// test message with both optional and nested message
message(201) LeafMsg {
    foo: Int;
}

message(202) MidMsg {
    leaf: LeafMsg?;
}

contract MessageOptionalChain {
    m: MidMsg;
    init() {
        self.m = MidMsg{ leaf: null };
    }
}