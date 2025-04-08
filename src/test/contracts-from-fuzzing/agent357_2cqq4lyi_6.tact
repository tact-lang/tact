struct Combo {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: Slice;
    f: String;
}

contract MultiTypeStorage {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 1,
            b: false,
            c: emptyCell(),
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: "test",
        };
    }
}