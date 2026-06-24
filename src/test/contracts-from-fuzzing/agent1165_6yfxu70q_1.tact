struct LargeStruct {
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
    k: Bool;
    l: Int;
    m: String;
    n: Slice;
    o: Cell;
}

contract LargeFields {
    huge: LargeStruct;
    
    init() {
        self.huge = LargeStruct{
            a: 1,
            b: true,
            c: "x",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: "y",
            j: myAddress(),
            k: false,
            l: 0,
            m: "z",
            n: emptyCell().asSlice(),
            o: emptyCell(),
        };
    }
}
