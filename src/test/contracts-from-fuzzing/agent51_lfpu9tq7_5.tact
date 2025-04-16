struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Cell;
    i: Slice;
}

contract WideStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "foo",
            d: null,
            e: false,
            f: null,
            g: myAddress(),
            h: emptyCell(),
            i: emptyCell().asSlice(),
        };
    }
}
