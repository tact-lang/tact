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

contract StructBigField {
    s: BigStruct;
    init() {
        self.s = BigStruct{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: beginCell(),
            f: emptyCell().asSlice(),
            g: myAddress(),
            h: null,
            i: null,
            j: null
        };
    }
    receive() {}
}