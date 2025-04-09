struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: Bool;
    l: Bool;
    m: Bool;
    n: Address;
    o: Address;
    p: String;
    q: String;
    r: Cell;
    s: Slice;
    t: Slice;
}

contract BigPersistent {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: 6,
            g: 7,
            h: 8,
            i: 9,
            j: 10,
            k: true,
            l: false,
            m: true,
            n: myAddress(),
            o: myAddress(),
            p: "p",
            q: "q",
            r: emptyCell(),
            s: emptyCell().asSlice(),
            t: emptyCell().asSlice(),
        };
    }

    receive() {}
}