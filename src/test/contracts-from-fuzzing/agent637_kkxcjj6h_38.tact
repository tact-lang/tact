struct AddressCell {
    a: Address;
    c: Cell;
}

contract Test {
    big: AddressCell;
    init() {
        self.big = AddressCell {
            a: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            c: emptyCell()
        };
    }
    receive() {}
}