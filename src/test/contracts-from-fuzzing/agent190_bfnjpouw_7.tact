struct Wide {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: String;
    l: String?;
    m: Int as uint8;
    n: Int? as uint8;
    o: Int as uint64;
    p: Int? as uint64;
}

contract TestContract {
    myData: Wide;

    init() {
        self.myData = Wide{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: myAddress(),
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: "hello",
            l: null,
            m: 5,
            n: null,
            o: 100,
            p: null,
        };
    }
}