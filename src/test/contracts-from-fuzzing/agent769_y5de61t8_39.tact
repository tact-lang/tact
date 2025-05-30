struct Packet {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
}

contract AllTypesContainer {
    pack: Packet;
    init() {
        self.pack = Packet{
            a: 1,
            b: "two",
            c: true,
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}