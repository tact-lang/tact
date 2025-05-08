struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Bool?;
    h: Int?;
    i: String?;
    j: Address;
}

contract LargeStructStorage {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a: 1,
            b: false,
            c: myAddress(),
            d: "text",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: myAddress(),
        };
    }
}