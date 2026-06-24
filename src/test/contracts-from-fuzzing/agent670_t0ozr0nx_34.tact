struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hi",
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: null,
            k: emptyCell().asSlice(),
            l: null,
        };
    }
}