struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract UseLargeStruct {
    state: LargeStruct;

    init() {
        self.state = LargeStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hi",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}