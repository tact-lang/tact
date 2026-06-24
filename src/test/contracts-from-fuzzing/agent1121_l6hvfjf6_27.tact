// Mix Address, Cell, Slice
contract MixedPrimitiveFields {
    addr: Address;
    cell: Cell;
    slice: Slice;

    init() {
        self.addr = myAddress();
        self.cell = emptyCell();
        self.slice = self.cell.asSlice();
    }
}