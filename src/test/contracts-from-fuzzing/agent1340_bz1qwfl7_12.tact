struct TenFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;
}

contract StructAsState {
    data: TenFields;

    init() {
        self.data = TenFields{
            a: 1,
            b: true,
            c: "test",
            d: null,
            e: null,
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: beginCell(),
            j: myAddress(),
        };
    }
}