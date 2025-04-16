struct CellStruct {
    x: Cell;
    y: Slice;
    z: Address;
}

contract TestContract {
    s: CellStruct;

    init() {
        self.s = CellStruct{x: emptyCell(), y: emptyCell().asSlice(), z: myAddress()};
    }
}