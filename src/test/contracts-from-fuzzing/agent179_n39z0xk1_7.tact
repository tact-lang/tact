struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract MultiTypeFields {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            a: 7,
            b: true,
            c: "ok",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}