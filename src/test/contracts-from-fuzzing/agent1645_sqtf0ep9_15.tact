struct HasCellAndAddress {
    x: Int;
    c: Cell;
    a: Address;
    s: Slice;
}

contract StructContainingLowLevels {
    data: HasCellAndAddress;

    init() {
        self.data = HasCellAndAddress{ x:5, c:emptyCell(), a: myAddress(), s: emptyCell().asSlice() };
    }
}