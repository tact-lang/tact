struct LongNested {
    a: Int;
    b: String;
    c: Bool;
    d: Slice;
    e: Address;
    f: Cell;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Slice?;
    k: Address?;
    l: Cell?;
}

contract TestContract {
    data: LongNested;

    init() {
        self.data = LongNested{
            a: 1,
            b: "b",
            c: true,
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: emptyCell(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}