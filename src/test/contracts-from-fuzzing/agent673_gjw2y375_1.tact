contract TestContract {
    counter: Int;
    flag: Bool;
    data: Cell;

    init() {
        self.counter = 1;
        self.flag = true;
        self.data = emptyCell();
    }
}