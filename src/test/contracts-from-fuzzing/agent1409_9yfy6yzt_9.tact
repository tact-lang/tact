struct Payload {
    bits: Slice;
    comment: String;
}

contract Storage {
    mainPayload: Payload;
    
    init() {
        self.mainPayload = Payload{
            bits: emptyCell().asSlice(),
            comment: "payload"
        };
    }
}
