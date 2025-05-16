struct Flat {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: Address;
    f: String;
}

contract FlatStructField {
    data: Flat;

    init() {
        self.data = Flat{
            a: 1,
            b: true,
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: myAddress(),
            f: "hi"
        };
    }
}