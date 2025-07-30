struct Combo {
    a: Int;
    b: Bool;
    c: Address?;
    d: String;
    e: Cell;
    f: Slice?;
}

contract TestContract {
    data: Combo;
    init() {
        self.data = Combo{
            a: 5,
            b: false,
            c: null,
            d: "test",
            e: emptyCell(),
            f: null
        };
    }
}