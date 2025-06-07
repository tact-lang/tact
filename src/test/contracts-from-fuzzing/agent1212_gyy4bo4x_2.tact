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
    k: Cell;
    l: Slice;
    m: Address;
    n: Int;
    o: Bool;
    p: String;
    q: Cell;
    r: Slice;
    s: Builder;
    t: Address;
}

contract LargeFieldsContract {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 1,
            b: true,
            c: "c",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: null,
            i: null,
            j: "j",
            k: emptyCell(),
            l: emptyCell().asSlice(),
            m: myAddress(),
            n: 0,
            o: false,
            p: "p",
            q: emptyCell(),
            r: emptyCell().asSlice(),
            s: beginCell(),
            t: myAddress(),
        };
    }
}