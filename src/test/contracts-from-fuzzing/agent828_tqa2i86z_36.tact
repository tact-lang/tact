struct Deep {
    val: Int as uint32;
    flag: Bool?;
}

message(0xFADE) OuterMsg {
    nested: Deep;
    cnt: Int;
}

contract TestContract {
    msgStore: OuterMsg;

    init() {
        self.msgStore = OuterMsg{
            nested: Deep{
                val: 123,
                flag: null
            },
            cnt: 888
        };
    }
}