contract OptionalAddressCell {
    optAddress: Address?;
    optCell: Cell?;

    init() {
        self.optAddress = null;
        self.optCell = emptyCell();
    }
}