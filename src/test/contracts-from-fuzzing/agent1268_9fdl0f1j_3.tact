struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Slice;
    h: Cell;
    i: Address;
    j: Slice?;
    k: Cell?;
    l: Address?;
}

contract LargeStructFields {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a: 1,
            b: true,
            c: "test",
            d: null,
            e: false,
            f: null,
            g: emptyCell().asSlice(),
            h: emptyCell(),
            i: myAddress(),
            j: null,
            k: null,
            l: null,
        };
    }
}