struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Address;
    i: String;
    j: Int;
    k: Bool;
    l: String;
}

contract Test {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: true,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: myAddress(),
            i: "hi",
            j: 42,
            k: false,
            l: "",
        };
    }
}