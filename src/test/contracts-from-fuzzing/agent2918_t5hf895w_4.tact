struct ManyScalars {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: String;
    l: String?;
}

contract TestContract {
    vals: ManyScalars;

    init() {
        self.vals = ManyScalars{
            a: 1,
            b: false,
            c: myAddress(),
            d: null,
            e: true,
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: "hello",
            l: null
        };
    }
}