struct Flat {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract FlatStorage {
    state: Flat;

    init() {
        self.state = Flat{
            a: 1,
            b: true,
            c: "fuzz",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell()
        };
    }
}