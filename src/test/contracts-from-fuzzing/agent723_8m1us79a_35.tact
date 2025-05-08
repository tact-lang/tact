contract TestContract {
    c: Cell?;

    init() {
        self.c = emptyCell();
    }

    receive() {}
}