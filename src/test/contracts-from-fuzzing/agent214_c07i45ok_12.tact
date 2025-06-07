struct Large {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell;
    k: Int;
    l: Bool;
    m: String;
    n: Int?;
    o: String?;
}

contract TestContract {
    large: Large;

    init() {
        self.large = Large{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "f",
            g: null,
            h: null,
            i: null,
            j: emptyCell(),
            k: 2,
            l: false,
            m: "m",
            n: null,
            o: null,
        };
    }
}