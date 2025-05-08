struct Payload {
    a: Int as uint8;
    rest: Slice as remaining;
}

contract HasRemainingStruct {
    payload: Payload;
    init() {
        self.payload = Payload{a:42, rest: emptyCell().asSlice()};
    }
}