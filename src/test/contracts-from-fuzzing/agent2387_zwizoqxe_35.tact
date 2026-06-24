struct Combo {
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
}

contract ComboTest {
    data: Combo;
    init() {
        self.data = Combo{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "test",
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: null,
        };
    }
}