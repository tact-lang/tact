struct ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: String;
    f: Cell;
    g: Slice;
    h: Address;
    i: String?;
    j: Bool?;
    k: Int?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: "hello",
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: myAddress(),
            i: null,
            j: null,
            k: null,
        };
    }
}