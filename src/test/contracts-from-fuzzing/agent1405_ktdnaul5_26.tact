struct NestedMessages {
    m1: MyMsg;
    m2: MyMsg;
}

message(0xABC) MyMsg {
    x: Int;
}

contract TwoMessagesNested {
    nested: NestedMessages;

    init() {
        self.nested = NestedMessages{
            m1: MyMsg{ x:10 },
            m2: MyMsg{ x:20 }
        };
    }
}