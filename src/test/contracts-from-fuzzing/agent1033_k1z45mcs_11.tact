struct MultiType {
    i: Int;
    b: Bool;
    s: String;
    sl: Slice;
    c: Cell;
    adr: Address;
    bl: Builder;
}

contract MixedPersistent {
    data: MultiType;

    init() {
        self.data = MultiType{
            i: 77,
            b: false,
            s: "mix",
            sl: emptyCell().asSlice(),
            c: emptyCell(),
            adr: myAddress(),
            bl: beginCell()
        };
    }
}