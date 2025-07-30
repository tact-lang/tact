contract TestContract {
    value: Int;
    text: String;
    data: Cell;

    init() {
        self.value = 1;
        self.text = "abc";
        self.data = emptyCell();
    }
}
