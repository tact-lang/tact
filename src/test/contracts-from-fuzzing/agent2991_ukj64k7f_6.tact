struct MixedLayout {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract Test {
    mixed: MixedLayout;

    init() {
        self.mixed = MixedLayout{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "abc",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}