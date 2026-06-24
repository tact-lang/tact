contract MultiField {
    flag: Bool;
    count: Int;
    owner: Address;
    data: Slice;
    message: String;
    init() {
        self.flag = true;
        self.count = 12345;
        self.owner = myAddress();
        self.data = emptyCell().asSlice();
        self.message = "hello";
    }
}