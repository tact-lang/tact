contract MixedPrimitives {
    num: Int;
    flag: Bool;
    addr: Address;
    code: Cell;
    dataSlice: Slice;
    text: String;

    init() {
        self.num = 1;
        self.flag = true;
        self.addr = myAddress();
        self.code = myCode();
        self.dataSlice = self.code.asSlice();
        self.text = "hello";
    }
}