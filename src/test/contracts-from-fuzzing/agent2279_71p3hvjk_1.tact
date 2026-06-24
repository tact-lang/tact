struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Cell;
    val5: Address;
    val6: Slice;
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Cell?;
    opt5: Address?;
    opt6: Slice?;
    nested1: Nested;
    nestedOpt1: Nested?;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "hi";
        self.val4 = emptyCell();
        self.val5 = myAddress();
        self.val6 = emptyCell().asSlice();
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
        self.opt5 = null;
        self.opt6 = null;
        self.nested1 = Nested{a:2,b:false};
        self.nestedOpt1 = null;
    }
}