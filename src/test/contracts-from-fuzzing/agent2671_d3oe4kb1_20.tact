struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice?;
}

contract ComboTypes {
    val: Combo;

    init() {
        self.val = Combo{
            a: 42,
            b: true,
            c: "hi",
            d: null,
            e: emptyCell(),
            f: null
        };
    }
}