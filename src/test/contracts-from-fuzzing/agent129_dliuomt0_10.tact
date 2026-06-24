// contract with many primitive persistent fields, some optional
contract PrimitiveMany {
    x: Int;
    y: Int?;
    flag: Bool;
    option: Bool?;
    s: String;
    so: String?;
    c: Cell;
    co: Cell?;
    sl: Slice;
    slo: Slice?;
    addr: Address;
    addro: Address?;

    init() {
        self.x = 1;
        self.y = null;
        self.flag = true;
        self.option = null;
        self.s = "hello";
        self.so = null;
        self.c = emptyCell();
        self.co = null;
        self.sl = emptyCell().asSlice();
        self.slo = null;
        self.addr = myAddress();
        self.addro = null;
    }
}
