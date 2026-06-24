struct Payload {
    fixed: Int as uint32;
    rest: Slice as remaining;
}

contract TestContract {
    messageData: Payload;

    init() {
        self.messageData = Payload{
            fixed: 77,
            rest: emptyCell().asSlice()
        };
    }
}