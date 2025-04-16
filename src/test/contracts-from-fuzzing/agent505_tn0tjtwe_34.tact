struct MessageEnvelope {
    op: Int as uint32;
    body: Slice as remaining;
}

contract EnvelopeField {
    env: MessageEnvelope;

    init() {
        self.env = MessageEnvelope{
            op: 12345,
            body: emptyCell().asSlice()
        };
    }
}
