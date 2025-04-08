struct OTPayload {
    data: Cell;
    metadata: Cell?;
    comment: String?;
}

contract TestOp {
    payload: OTPayload;

    init() {
        self.payload = OTPayload{
            data: emptyCell(),
            metadata: null,
            comment: null,
        };
    }
}