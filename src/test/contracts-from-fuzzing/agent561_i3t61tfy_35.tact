struct OptionalAddrCell {
    a: Address?;
    c: Cell?;
}

contract OptAddrCellStorage {
    val: OptionalAddrCell;

    init() {
        self.val = OptionalAddrCell{a:null,c:null};
    }
}