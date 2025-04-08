struct BigOptionalStruct {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Bool;
    h: Int;
    i: String;
}

contract BigOptionalField {
    store: BigOptionalStruct;

    init() {
        self.store = BigOptionalStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: true,
            h: 9,
            i: "hi"
        };
    }
}