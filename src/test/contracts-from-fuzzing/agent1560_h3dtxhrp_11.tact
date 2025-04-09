struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Cell;
    i: Bool;
    j: Int;
    k: String;
}
contract TestContract {
    wideStruct: Wide;
    init() {
        self.wideStruct = Wide{
            a: 1,
            b: false,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: myAddress(),
            h: emptyCell(),
            i: true,
            j: 42,
            k: "foo"
        };
    }
}