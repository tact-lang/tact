struct BigCombo {
    a: Int;
    b: Bool;
    c: String?;
    d: Slice?;
    e: Address;
    f: Cell;
}

contract BigComboField {
    field: BigCombo;

    init() {
        self.field = BigCombo{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: myAddress(),
            f: emptyCell()
        };
    }
}