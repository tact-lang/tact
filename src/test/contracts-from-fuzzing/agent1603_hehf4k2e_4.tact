struct ManyFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Builder;
    e: Slice;
    f: Address;
    g: String;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract WideStructContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: emptyCell(),
            d: beginCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: "hello",
            h: null,
            i: false,
            j: null,
        };
    }
}