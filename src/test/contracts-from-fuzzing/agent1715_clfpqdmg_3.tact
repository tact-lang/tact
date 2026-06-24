struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: String;
    h: Bool;
    i: Int;
    j: Int?;
}

contract LargeStructTest {
    many: ManyFields;

    init() {
        self.many = ManyFields{
            a: 1,
            b: false,
            c: "a",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: "b",
            h: true,
            i: 42,
            j: null,
        };
    }
}