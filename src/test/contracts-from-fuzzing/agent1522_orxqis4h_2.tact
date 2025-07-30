struct ManyFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Cell;
    f: Cell?;
    g: Slice;
    h: Slice?;
    i: Address;
    j: Address?;
    k: String;
    l: String?;
}

contract WideStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: emptyCell(),
            f: null,
            g: emptyCell().asSlice(),
            h: null,
            i: myAddress(),
            j: null,
            k: "test",
            l: null,
        };
    }

    receive() {
        let _ = self.data;
    }
}