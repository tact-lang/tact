struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Int;
    k: Bool;
    l: String;
    m: Cell;
    n: Slice;
    o: Address;
}

contract WideFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: false,
            c: "x",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: true,
            i: "y",
            j: 2,
            k: true,
            l: "z",
            m: emptyCell(),
            n: emptyCell().asSlice(),
            o: myAddress()
        };
    }
}