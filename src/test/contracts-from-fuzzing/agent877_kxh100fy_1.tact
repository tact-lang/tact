contract TestContract {
    largeInt: Int as int257;
    smallInt: Int as int8;
    flag: Bool;
    wallet: Address;
    blob: Cell;
    data: Slice;
    text: String;

    init() {
        self.largeInt = 1000000000000;
        self.smallInt = 127;
        self.flag = true;
        self.wallet = myAddress();
        self.blob = emptyCell();
        self.data = emptyCell().asSlice();
        self.text = "hello";
    }
}