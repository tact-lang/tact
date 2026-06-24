struct PrimContainer {
    addr: Address;
    sliceVal: Slice;
    cellVal: Cell;
}

contract TestContract {
    container: PrimContainer;

    init() {
        self.container = PrimContainer{
            addr: myAddress(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell()
        };
    }
}