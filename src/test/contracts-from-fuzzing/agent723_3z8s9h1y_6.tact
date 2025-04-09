struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
    k: Int;
    l: Bool;
    m: String;
    n: Int?;
    o: Bool?;
    p: String?;
    q: Cell;
    r: Cell?;
    s: Address;
    t: Address?;
}

contract TestContract {
    record: LongStruct;

    init() {
        self.record = LongStruct{
            a: 1,
            b: true,
            c: "str",
            d: 5,
            e: false,
            f: null,
            g: emptyCell(),
            h: emptyCell(),
            i: myAddress(),
            j: null,
            k: 2,
            l: false,
            m: "hello",
            n: null,
            o: null,
            p: null,
            q: emptyCell(),
            r: emptyCell(),
            s: myAddress(),
            t: null,
        };
    }
}