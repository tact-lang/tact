struct Inner {
    a: Int;
    b: Bool;
}

contract Test1 {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Cell;
    val5: Slice;
    val6: Address;
    val7: Inner;

    init() {
        self.val1 = 42;
        self.val2 = true;
        self.val3 = "hey";
        self.val4 = emptyCell();
        self.val5 = self.val4.asSlice();
        self.val6 = myAddress();
        self.val7 = Inner{a:1, b:false};
    }
}