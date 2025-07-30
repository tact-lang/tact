contract Test1 {
    flag: Bool;
    count: Int;
    addr: Address;
    text: String;
    data: Cell;
    builder: Builder;
    slice: Slice;
    
    init() {
        self.flag = true;
        self.count = 42;
        self.addr = myAddress();
        self.text = "hello";
        self.data = emptyCell();
        self.builder = beginCell();
        self.slice = emptyCell().asSlice();
    }
}