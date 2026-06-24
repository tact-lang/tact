contract TestContract {
    value1: Int;
    value2: Bool;
    value3: String;
    value4: Cell;
    value5: Slice;
    value6: Address;

    init() {
        self.value1 = 0;
        self.value2 = true;
        self.value3 = "abc";
        self.value4 = emptyCell();
        self.value5 = emptyCell().asSlice();
        self.value6 = myAddress();
    }

    receive() {
        let add: Int = 0;
        if (self.value2) {
            add = 1;
        } else {
            add = 0;
        }
        let _ = self.value1 + add;
        let _ = self.value3;
        let _ = self.value4;
        let _ = self.value5;
        let _ = self.value6;
    }
}