struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Builder;
    f: Slice;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract BigState {
    s: BigStruct;
    init() {
        self.s = BigStruct{
            a: 42,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: beginCell(),
            f: emptyCell().asSlice(),
            g: myAddress(),
            h: null,
            i: null,
            j: null
        };
    }
}