message(0xAAAA) InnerMsg {}
message(0xBBBB) MidMsg { inner: InnerMsg; }
message(0xCCCC) OutMsg { mid: MidMsg; }

contract MsgChainStorage {
    data: OutMsg;

    init() {
        self.data = OutMsg{
            mid: MidMsg{
                inner: InnerMsg{},
            },
        };
    }
}
