contract Test {
    number: Int;
    flag: Bool;
    text: String;
    sl: Slice;
    cl: Cell;
    addr: Address;
    
    optNumber: Int?;
    optFlag: Bool?;
    optText: String?;
    optSl: Slice?;
    optCl: Cell?;
    optAddr: Address?;

    init() {
        self.number = 1;
        self.flag = true;
        self.text = "abc";
        self.sl = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
        self.cl = cell("te6cckEBAQEAAgAAAEysuc0=");
        self.addr = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
        self.optNumber = null;
        self.optFlag = null;
        self.optText = null;
        self.optSl = null;
        self.optCl = null;
        self.optAddr = null;
    }
}