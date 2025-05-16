struct Multi {
    i1: Int;
    i2: Int as uint64;
    i3: Int as int16;
    b: Bool;
    s: String;
    opt: Int?;
    addr: Address;
    cell: Cell;
    slice: Slice;
}

contract LotsOfVariations {
    f: Multi;
    init() {
        self.f = Multi{
            i1: 123,
            i2: 456,
            i3: -12,
            b: true,
            s: "abc",
            opt: null,
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice()
        };
    }
}