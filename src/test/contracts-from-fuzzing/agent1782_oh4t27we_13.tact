struct Combo {
    a: Int;
    b: Bool;
    c: String?;
    d: Cell;
    e: Slice;
    f: Builder;
}

contract ManyTypes {
    store: Combo;

    init() {
        self.store = Combo{
            a: 123,
            b: true,
            c: null,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell()
        };
    }
}