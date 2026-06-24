struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Address;
    f: Cell;
    g: Slice;
    h: Builder;
    i: String;
    j: Int?;
    k: Bool;
    l: Int;
    m: String;
    n: Int;
    o: Bool;
    p: Int?;
    q: String;
    r: Bool;
    s: Int;
    t: Int?;
}

contract LargeStructContract {
    dat: LargeStruct;

    init() {
        self.dat = LargeStruct{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: myAddress(),
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: beginCell(),
            i: "i",
            j: null,
            k: false,
            l: 999,
            m: "m",
            n: 888,
            o: false,
            p: null,
            q: "q",
            r: true,
            s: 777,
            t: null,
        };
    }
}
