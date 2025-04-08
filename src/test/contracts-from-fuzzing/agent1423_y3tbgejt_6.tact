struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Cell;
}

contract WideStorage {
    storage: WideStruct;
    
    init() {
        self.storage = WideStruct{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: "xyz",
            j: emptyCell()
        };
    }
}