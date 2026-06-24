struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
    k: Slice;
    l: Slice?;
}

contract SingleBigStruct {
    state: BigStruct;
    
    init() {
        self.state = BigStruct{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: null,
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null,
            k: emptyCell().asSlice(),
            l: null
        };
    }
}