struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: String;
    i: Int?;
    j: Bool?;
    k: Address;
}

contract BigStructContract {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a: 1,
            b: true,
            c: "c",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: "h",
            i: 2,
            j: false,
            k: myAddress()
        };
    }
}