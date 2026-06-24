struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;
}

contract LargeStorage {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 1,
            b: true,
            c: "ok",
            d: null,
            e: false,
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: beginCell(),
            j: myAddress()
        };
    }
}
