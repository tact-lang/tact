fun testReturnCell(): Cell {
    return beginCell().storeUint(1, 32).endCell();
}

contract TestContract {
    receive() {
        testReturnCell();
    }
}