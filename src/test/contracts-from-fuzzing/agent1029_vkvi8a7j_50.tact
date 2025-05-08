struct OptionalAddrCell {
    addr: Address?;
    cell: Cell?;
}

contract AddrCellOptContract {
    d: OptionalAddrCell;
    init() {
        self.d = OptionalAddrCell{addr:null,cell:null};
    }
}