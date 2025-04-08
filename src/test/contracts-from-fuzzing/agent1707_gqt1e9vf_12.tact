struct RecStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address;
    k: Cell;
    l: Slice;
}

contract RecContract {
    rec: RecStruct;

    init() {
        self.rec = RecStruct{
            a: 1,
            b: false,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: true,
            i: "def",
            j: myAddress(),
            k: emptyCell(),
            l: emptyCell().asSlice()
        };
    }
}