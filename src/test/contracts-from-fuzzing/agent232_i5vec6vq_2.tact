struct BigFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Cell;
    g: Slice;
    h: Address;
    i: String?;
    j: Int;
    k: Bool;
    l: Int?;
    m: Bool?;
    n: String;
    o: Cell;
}

contract TestContract {
    data: BigFields;

    init() {
        self.data = BigFields{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "hello",
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: myAddress(),
            i: null,
            j: 42,
            k: false,
            l: null,
            m: true,
            n: "world",
            o: emptyCell()
        };
    }
}