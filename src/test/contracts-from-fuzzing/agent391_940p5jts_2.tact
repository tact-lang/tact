struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Bool?;
    h: Int?;
    i: String;
    j: Int;
    k: Bool;
    l: Address;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: 7,
            i: "there",
            j: 42,
            k: false,
            l: myAddress(),
        };
    }
}