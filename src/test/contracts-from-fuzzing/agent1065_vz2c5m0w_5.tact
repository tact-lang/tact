contract MultiplePrimitiveFields {
    int1: Int;
    int2: Int;
    bool1: Bool;
    bool2: Bool;
    str1: String;
    str2: String;

    init() {
        self.int1 = 10;
        self.int2 = 20;
        self.bool1 = true;
        self.bool2 = false;
        self.str1 = "hello";
        self.str2 = "world";
    }
}
