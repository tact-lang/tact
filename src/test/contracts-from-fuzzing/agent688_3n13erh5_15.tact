struct Raw {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
}

contract TestContract {
    raw: Raw;

    init() {
        self.raw = Raw{
            a: 5,
            b: false,
            c: "abc",
            d: emptyCell(),
            e: myAddress(),
        };
    }
}