contract TestContract {
    bigStruct: Big;

    init() {
        self.bigStruct = Big{
            a: true,
            b: "one",
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: null,
            f: myAddress(),
            g: 100
        };
    }
}

struct Big {
    a: Bool;
    b: String;
    c: Slice;
    d: Cell;
    e: String?;
    f: Address;
    g: Int;
}