contract MixedTypes {
    flag: Bool;
    counter: Int;
    data: Cell;
    info: String;
    addr: Address;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;

    init() {
        self.flag = true;
        self.counter = 42;
        self.data = emptyCell();
        self.info = "hello";
        self.addr = myAddress();
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
    }
}