contract MixedFieldOrder {
    int1: Int = 1;
    opt1: Int?;
    bool1: Bool = false;
    str1: String = "a";
    opt2: String?;
    opt3: Bool?;
    int2: Int = 2;
    bool2: Bool = true;

    receive() {
        self.opt1 = 3;
        self.opt2 = "hello";
        self.opt3 = false;
        self.int1 = 100;
        self.int2 = 200;
        self.bool1 = true;
        self.bool2 = false;
        self.str1 = "bye";
    }
}