contract Test {
    optInt: Int?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.optInt = 42;
        self.optAddr = myAddress();
        self.optCell = emptyCell();
        self.optSlice = emptyCell().asSlice();
    }
}

contract Dummy {
    receive() {}
}
