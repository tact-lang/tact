struct Small {
    a: Int;
}

contract LongMix {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Address;
    val5: Cell;
    val6: Slice;
    val7: Small;
    val8: Small?;

    init() {
        self.val1=1; self.val2=true; self.val3="x"; self.val4=myAddress();
        self.val5=emptyCell(); self.val6=emptyCell().asSlice();
        self.val7=Small{a:7}; self.val8=null;
    }
}
