struct WithSliceCellAddr {
    s: Slice;
    c: Cell;
    addr: Address;
}

contract SliceCellAddrTest {
    val: WithSliceCellAddr;

    init() {
        self.val = WithSliceCellAddr{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            addr: myAddress()
        };
    }
}
