contract ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    optI: Int?;
    optB: Bool?;
    optS: String?;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "hello";
        self.addr = myAddress();
        self.c = emptyCell();
        self.optI = null;
        self.optB = false;
        self.optS = null;
    }
}