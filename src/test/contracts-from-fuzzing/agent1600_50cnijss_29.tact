struct Combo {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Address;
    f: Address?;
    g: Bool;
    h: Bool?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
}

contract TestContract {
    myData: Combo;

    init() {
        self.myData = Combo{
            a: 1,
            b: null,
            c: "hi",
            d: null,
            e: myAddress(),
            f: null,
            g: true,
            h: null,
            i: emptyCell(),
            j: null,
            k: emptyCell().asSlice(),
            l: null
        };
    }
}