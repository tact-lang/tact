struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: String;
    j: String?;
}

contract TestContract {
    combo: Combo;
    init() {
        self.combo = Combo{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: myAddress(),
            f: null,
            g: emptyCell(),
            h: null,
            i: "str",
            j: null
        };
    }
}