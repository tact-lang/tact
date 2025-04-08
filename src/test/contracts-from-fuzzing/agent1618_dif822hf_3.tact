struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Cell;
    g: Slice;
    h: Address;
    i: String?;
    j: Address?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "hello",
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: myAddress(),
            i: null,
            j: null
        };
    }
}