// Very large struct with many mixed fields
struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Int;
    i: Int;
    j: String;
    k: Bool;
    l: Address;
    m: Cell;
    n: Slice;
    o: String?;
    p: Int;
    q: Bool;
    r: Int?;
    s: String;
    t: Bool;
}

contract TestContract {
    bigData: BigStruct;

    init() {
        self.bigData = BigStruct{
            a: 1,
            b: true,
            c: "x",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: 2,
            i: 3,
            j: "y",
            k: false,
            l: myAddress(),
            m: emptyCell(),
            n: emptyCell().asSlice(),
            o: null,
            p: 4,
            q: true,
            r: null,
            s: "z",
            t: false,
        };
    }
}