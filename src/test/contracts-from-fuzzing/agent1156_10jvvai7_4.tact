contract ManyTypes {
    i: Int;
    u8: Int as uint8;
    i16: Int as int16;
    coinsVal: Int as coins;
    flag: Bool;
    addr: Address;
    s: String;
    c: Cell;
    sl: Slice;

    init() {
        self.i = 0;
        self.u8 = 1;
        self.i16 = -10;
        self.coinsVal = 1000000;
        self.flag = true;
        self.addr = myAddress();
        self.s = "Hello";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
    }
}