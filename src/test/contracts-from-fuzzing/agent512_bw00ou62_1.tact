contract TestContract {
    first: Int;
    second: Bool;
    third: Address;
    fourth: Cell;
    fifth: Slice;
    sixth: String;

    init() {
        self.first = 1;
        self.second = true;
        self.third = myAddress();
        self.fourth = beginCell().endCell();
        self.fifth = self.fourth.asSlice();
        self.sixth = "hello";
    }
}
