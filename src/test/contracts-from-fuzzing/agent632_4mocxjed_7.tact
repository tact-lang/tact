struct Combo {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
    f: Int?;
    g: Bool?;
    h: Address?;
    i: Cell?;
    j: String?;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: "hello",
            f: null,
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}