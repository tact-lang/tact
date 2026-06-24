struct HasAddress {
    addr: Address;
}

struct HasCell {
    cell: Cell;
}

contract MixedAddrCell {
    x: HasAddress;
    y: HasCell;
    init() {
        self.x = HasAddress{ addr: myAddress() };
        self.y = HasCell{ cell: emptyCell() };
    }
}