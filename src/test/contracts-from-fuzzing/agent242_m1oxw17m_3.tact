struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Builder;
    f: Slice;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract WideVariety {
    storage: ManyTypes;

    init() {
        self.storage = ManyTypes{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: beginCell(),
            f: emptyCell().asSlice(),
            g: myAddress(),
            h: null,
            i: false,
            j: null,
        };
    }
}