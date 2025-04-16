struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 2,
            b: true,
            c: "x",
            d: null,
            e: false,
            f: "",
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: null,
            k: emptyCell().asSlice(),
            l: null
        };
    }
}