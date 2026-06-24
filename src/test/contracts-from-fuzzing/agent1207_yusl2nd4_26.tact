contract ManyPrimitiveOptionals {
    aa: Int?;
    bb: Bool?;
    cc: String?;

    init() {
        self.aa = 1;
        self.bb = null;
        self.cc = "zzz";
    }
}