struct HasRemain {
    before: Int as uint8;
    payload: Slice as remaining;
}

contract RemainField {
    f: HasRemain;
    init() {
        self.f = HasRemain{ before:5, payload: emptyCell().asSlice() };
    }
}