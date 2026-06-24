struct Packed {
    int4: Int as int4;
    uint8: Int as uint8;
    opt: Bool?;
    tail: Slice as remaining;
}

contract Test {
    data: Packed;

    init() {
        self.data = Packed{
            int4: 7,
            uint8: 255,
            opt: true,
            tail: emptyCell().asSlice()
        };
    }
}
