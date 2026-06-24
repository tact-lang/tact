struct BigStruct {
    a: Int;
    b: String;
    c: Cell;
    d: Slice;
    e: Builder;
    f: Int?;
    g: String?;
    h: Cell;
    i: Slice;
    j: Builder;
    k: Bool;
    l: Bool?;
    m: Address;
    n: Address?;
    o: Int;
    p: Int;
}

contract TestContract {
    bstruct: BigStruct;
    init() {
        self.bstruct = BigStruct{
            a: 1,
            b: "hi",
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: beginCell(),
            f: null,
            g: null,
            h: emptyCell(),
            i: emptyCell().asSlice(),
            j: beginCell(),
            k: true,
            l: false,
            m: myAddress(),
            n: null,
            o: 42,
            p: 55
        };
    }
}