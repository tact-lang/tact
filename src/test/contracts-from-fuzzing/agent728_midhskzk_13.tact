contract ExtremeVals {
    a: Int as uint8 = 255;
    b: Int as int8 = -128;
    c: Int = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    d: Int = -0x8000000000000000000000000000000000000000000000000000000000000000;
    flag: Bool = true;
    txt: String = "";

    init() {
        self.a = 255;
        self.b = -128;
        self.c = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        self.d = -0x8000000000000000000000000000000000000000000000000000000000000000;
        self.flag = false;
        self.txt = "done";
    }
}