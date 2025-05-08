// Stress test many diverse types in persistent state
contract ComboFields {
    num: Int;
    flag: Bool;
    addr: Address;
    text: String;
    optNum: Int?;
    optFlag: Bool?;
    optAddr: Address?;
    optText: String?;

    init() {
        self.num = 1;
        self.flag = true;
        self.addr = myAddress();
        self.text = "hello";
        self.optNum = null;
        self.optFlag = null;
        self.optAddr = null;
        self.optText = null;
    }

    receive() {
        self.num += 10;
    }
}