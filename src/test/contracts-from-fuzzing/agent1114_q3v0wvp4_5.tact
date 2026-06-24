struct PrimitiveFields {
    x: Int;
    y: Bool;
    z: Address;
    text: String;
    cell: Cell;
}

contract PrimPersistence {
    vals: PrimitiveFields;

    init() {
        self.vals = PrimitiveFields{
            x: 12,
            y: true,
            z: myAddress(),
            text: "testing",
            cell: emptyCell(),
        };
    }
}