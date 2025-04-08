contract TestContract {
    var1: Int as uint4 = 7;
    var2: Int as uint8 = 255;
    var3: Int as int16 = -12345;
    var4: Int = 123456789123456789;

    init() {
        self.var1 = 2;
        self.var2 = 254;
        self.var3 = -123;
        self.var4 = 100100;
    }

    receive() {
        let _ = self.var3;
    }
}