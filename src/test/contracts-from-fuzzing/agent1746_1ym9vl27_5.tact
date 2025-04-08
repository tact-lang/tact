contract TestContract {
    count: Int as uint4 = 5;
    flag: Bool = true;
    data: Cell;

    init() {
        self.data = emptyCell();
    }
}