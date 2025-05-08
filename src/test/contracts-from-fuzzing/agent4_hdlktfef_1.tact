struct DeepStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Int?;
    g: String?;
    h: Bool?;
}

contract NestedPersist {
    s: DeepStruct;

    init() {
        self.s = DeepStruct{
            a: 123,
            b: true,
            c: "text",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: 456,
            g: "opt",
            h: false,
        };
    }
}
