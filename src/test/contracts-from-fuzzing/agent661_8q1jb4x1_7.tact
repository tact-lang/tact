struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool;
    i: String?;
    j: Address?
}

contract TestContract {
    val: Combo;

    init() {
        self.val = Combo{
            a: 1,
            b: null,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: true,
            i: null,
            j: null
        };
    }
}