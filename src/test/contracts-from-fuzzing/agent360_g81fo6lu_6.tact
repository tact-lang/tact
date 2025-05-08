struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract TestContract {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: 1,
            h: true,
            i: "ok",
            j: null,
            k: emptyCell(),
            l: emptyCell().asSlice(),
        };
    }
}