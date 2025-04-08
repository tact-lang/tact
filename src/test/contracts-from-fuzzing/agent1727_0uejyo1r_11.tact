struct Flat {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
}

contract MultiTypesNested {
    value: Flat;

    init() {
        self.value = Flat{
            a: 7,
            b: true,
            c: "ok",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: emptyCell(),
        };
    }
}
