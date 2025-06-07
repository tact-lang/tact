contract TestContract {
    flag: Bool;
    counter: Int;
    data: Cell;
    info: Slice;
    user: Address;
    text: String;

    init() {
        self.flag = true;
        self.counter = 42;
        self.data = emptyCell();
        self.info = self.data.asSlice();
        self.user = myAddress();
        self.text = "hello";
    }
}