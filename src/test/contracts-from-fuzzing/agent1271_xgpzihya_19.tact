struct ComplexSerial {
    i: Int as uint8;
    j: Int as uint64;
    flag: Bool;
    txt: String;
    tail: Slice as remaining;
}

contract SerializeEdge {
    data: ComplexSerial;
    init() {
        self.data = ComplexSerial{
            i: 255,
            j: 1000000,
            flag: true,
            txt: "hi",
            tail: emptyCell().asSlice()
        };
    }
    receive() {}
}