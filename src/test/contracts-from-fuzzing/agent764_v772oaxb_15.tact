struct Crazy {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract AllFieldKinds {
    data: Crazy;

    init() {
        self.data = Crazy{
            a: 1,
            b: "hi",
            c: true,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}