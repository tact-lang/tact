struct WrapAddrCell {
    addr: Address;
    cell: Cell;
}

contract PairStore {
    pair: WrapAddrCell;

    init() {
        self.pair = WrapAddrCell{
            addr: myAddress(),
            cell: emptyCell()
        };
    }
}
