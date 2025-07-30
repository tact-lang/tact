contract PrimitiveOptionalMix {
    iv: Int = 1;
    bv: Bool = true;
    sv: String = "hi";
    oi: Int?;
    ob: Bool?;
    os: String?;

    receive() {
        self.iv = 100;
        self.bv = false;
        self.sv = "bye";
        self.oi = 77;
        self.ob = null;
        self.os = "moo";
    }
}