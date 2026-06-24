contract MixedLiterals {
    int1: Int = 42;
    int2: Int = 0x2A;
    int3: Int = 0b101010;
    int4: Int = 0o52;
    txt: String = "hello";
    flag: Bool = true;

    init() {
        self.int1 = 42;
        self.int2 = 42;
        self.int3 = 42;
        self.int4 = 42;
        self.txt = "hello";
        self.flag = true;
    }
}
