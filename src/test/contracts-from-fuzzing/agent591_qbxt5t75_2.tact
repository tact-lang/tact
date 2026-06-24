struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool;
    h: Int;
    i: String;
    j: Slice;
    k: Cell;
    l: Address;
}

contract WideFields {
    store: LargeStruct;

    init() {
        self.store = LargeStruct{
            a: 1,
            b: true,
            c: "x",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: false,
            h: 2,
            i: "y",
            j: emptyCell().asSlice(),
            k: emptyCell(),
            l: myAddress()
        };
    }
}