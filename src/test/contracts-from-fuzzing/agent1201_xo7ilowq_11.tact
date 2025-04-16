struct WideStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int;
    h: Bool;
    i: Address;
    j: Cell;
    k: Slice;
    l: String;
}

contract TestContract {
    wide: WideStruct;

    init() {
        self.wide = WideStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "abc",
            g: 2,
            h: false,
            i: myAddress(),
            j: emptyCell(),
            k: emptyCell().asSlice(),
            l: "def"
        };
    }
}