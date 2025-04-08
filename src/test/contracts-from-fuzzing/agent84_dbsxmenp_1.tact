struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Cell?;
    k: Address?;
    l: Slice?;
}

contract TestContract {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: 2,
            h: null,
            i: true,
            j: null,
            k: null,
            l: null,
        };
    }
}
