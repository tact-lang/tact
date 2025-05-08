struct Combo {
    a: Int as int32;
    b: Bool;
    c: Address?;
    d: Cell;
    e: Slice?;
    f: String;
    g: Int?;
}

contract TestContract {
    comboData: Combo;

    init() {
        self.comboData = Combo{
            a: -12345,
            b: true,
            c: null,
            d: emptyCell(),
            e: null,
            f: "sample",
            g: null
        };
    }
}