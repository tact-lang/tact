struct Wide {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Bool?;
    g: Int?;
    h: Address;
    i: String?;
    j: Slice?;
    k: Cell?;
    l: Address?;
    m: Bool;
}

contract TestContract {
    info: Wide;

    init() {
        self.info = Wide{
            a: 0,
            b: false,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: "",
            f: null,
            g: null,
            h: myAddress(),
            i: null,
            j: null,
            k: null,
            l: null,
            m: true,
        };
    }
}