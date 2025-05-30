struct BigStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
    f: String;
    g: Bool?;
    h: Int?;
    i: Address?;
    j: Slice?;
    k: Cell?;
    l: String?;
}

contract BigStructPersist {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: "hello",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}
