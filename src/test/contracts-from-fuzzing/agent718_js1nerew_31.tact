struct SliceCellAddr {
    sl: Slice;
    cl: Cell;
    ad: Address;
}

contract TestContract {
    data: SliceCellAddr;

    init() {
        self.data = SliceCellAddr{
            sl: emptyCell().asSlice(),
            cl: emptyCell(),
            ad: myAddress()
        };
    }
}