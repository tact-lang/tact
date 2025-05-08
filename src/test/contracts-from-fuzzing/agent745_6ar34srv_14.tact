contract MixedStructSimple {
    n: Int;
    flag: Bool;
    addr: Address;
    cell: Cell;
    slice: Slice;
    text: String;
    
    init() {
        self.n = 77;
        self.flag = true;
        self.addr = myAddress();
        self.cell = emptyCell();
        self.slice = emptyCell().asSlice();
        self.text = "hello";
    }
}