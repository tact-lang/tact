struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String;
    k: Int;
    l: Bool;
    m: String;
    n: Cell;
    o: Slice;
    p: Builder;
    q: Address;
}

contract LargeContract {
    field: LargeStruct;

    init() {
        self.field = LargeStruct{
            a: 1,
            b: true,
            c: "c",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: null,
            i: false,
            j: "j",
            k: 42,
            l: false,
            m: "m",
            n: emptyCell(),
            o: emptyCell().asSlice(),
            p: beginCell(),
            q: myAddress()
        };
    }
}