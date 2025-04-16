contract ManyPrimitiveFields {
    int1: Int;
    int2: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    opt_int: Int?;
    opt_bool: Bool?;
    opt_str: String?;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.b1 = true;
        self.b2 = false;
        self.s1 = "Hi";
        self.s2 = "There";
        self.opt_int = null;
        self.opt_bool = true;
        self.opt_str = null;
    }
}