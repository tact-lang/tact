struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Int?;
    f: Bool?;
    g: String;
    h: Cell;
    i: Address;
    j: String?;
}

contract LargeStorage {
    item: LargeStruct;

    init() {
        self.item = LargeStruct {
            a: 1,
            b: false,
            c: "a",
            d: emptyCell().asSlice(),
            e: null,
            f: true,
            g: "b",
            h: emptyCell(),
            i: myAddress(),
            j: null,
        };
    }
}