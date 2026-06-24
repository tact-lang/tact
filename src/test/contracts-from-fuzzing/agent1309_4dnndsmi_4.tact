struct Mixed {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "",
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null,
        };
    }
}