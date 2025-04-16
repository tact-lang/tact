contract TestContract {
    i: Int;
    i8: Int as int8;
    i16: Int as int16;
    u8: Int as uint8;
    u16: Int as uint16;
    flag: Bool;
    addr: Address;
    cl: Cell;
    sl: Slice;
    txt: String;

    init() {
        self.i = 0;
        self.i8 = 1;
        self.i16 = 2;
        self.u8 = 3;
        self.u16 = 4;
        self.flag = true;
        self.addr = myAddress();
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
        self.txt = "test";
    }

    receive() {
        self.i = 42;
    }
}