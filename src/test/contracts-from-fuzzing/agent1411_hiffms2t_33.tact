// optional cell in contract persistent storage
contract TestContract {
    optCell: Cell?;
    init() {
        self.optCell = emptyCell();
    }
}