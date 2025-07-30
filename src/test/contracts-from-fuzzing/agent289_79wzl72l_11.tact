struct RemainingStruct {
    header: Int as uint32;
    payload: Slice as remaining;
}

contract RemainingStructStorage {
    messageData: RemainingStruct;

    init() {
        self.messageData = RemainingStruct{
            header: 42,
            payload: emptyCell().asSlice()
        };
    }
}