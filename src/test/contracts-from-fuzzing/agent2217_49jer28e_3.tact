struct ManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Address?;
    i: Cell?;
    j: String?;
}

contract Storage {
    record: ManyTypes;

    init() {
        self.record = ManyTypes{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "test",
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}
