contract ManyTypes {
    n: Int;
    flag: Bool;
    addr: Address;
    data: Cell;
    sl: Slice;
    txt: String;
    optInt: Int?;
    optAddr: Address?;

    init() {
        self.n = 123;
        self.flag = true;
        self.addr = myAddress();
        self.data = emptyCell();
        self.sl = emptyCell().asSlice();
        self.txt = "hello";
        self.optInt = null;
        self.optAddr = null;
    }
}