struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Cell;
    f: Slice;
    g: Builder;
    h: String;
    i: Address;
    j: Int;
    k: Bool;
    l: Int?;
}

contract TestLargeFields {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: "hey",
            i: myAddress(),
            j: 42,
            k: true,
            l: null,
        };
    }
}
