struct BigOptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Int?;
    g: Bool?;
    h: Address?;
    i: String?;
    j: Cell?;
    k: Int?;
    l: Bool?;
    m: Address?;
    n: String?;
    o: Cell?;
}

contract LargeOptionalPersistent {
    data: BigOptionalStruct;

    init() {
        self.data = BigOptionalStruct{
            a: null,
            b: true,
            c: null,
            d: "", 
            e: emptyCell(),
            f: 6,
            g: null,
            h: myAddress(),
            i: null,
            j: emptyCell(),
            k: null,
            l: false,
            m: null,
            n: "hello",
            o: emptyCell()
        };
    }
}
