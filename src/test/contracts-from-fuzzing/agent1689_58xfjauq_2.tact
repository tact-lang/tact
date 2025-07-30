struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool?;
    h: Int?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "Test",
            g: false,
            h: 123,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}