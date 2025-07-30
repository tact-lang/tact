struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    h: Int?;
    i: Address?;
    j: Slice?;
    k: Bool?;
    l: String?;
}

contract TestLarge {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}
