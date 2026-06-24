struct BigFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Slice;
    h: Builder;
    i: Bool?;
    j: String;
}

contract BigTest {
    storage: BigFields;

    init() {
        self.storage = BigFields {
            a: 1,
            b: true,
            c: "Hi",
            d: emptyCell(),
            e: myAddress(),
            f: null,
            g: emptyCell().asSlice(),
            h: beginCell(),
            i: null,
            j: "Done",
        };
    }
}