// Test optional address and cell fields
contract TestContract {
    optAddr: Address?;
    optCell: Cell?;

    init() {
        self.optAddr = null;
        self.optCell = null;
    }
}