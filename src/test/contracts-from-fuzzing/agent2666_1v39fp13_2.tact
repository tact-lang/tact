struct DeepStruct {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Cell;
    i: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
    z: String;
}

contract DeepFields {
    rec: DeepStruct;

    init() {
        self.rec = DeepStruct{
            a: 10,
            b: "deep",
            c: true,
            d: null,
            e: false,
            f: null,
            g: myAddress(),
            h: emptyCell(),
            i: InnerStruct{
                x: 1,
                y: null,
                z: "inner",
            },
        };
    }
}