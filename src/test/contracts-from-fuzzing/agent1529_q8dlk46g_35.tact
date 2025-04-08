contract OptionalsMix {
    int1: Int?;
    int2: Int?;
    int3: Int;
    str1: String?;
    str2: String;

    init() {
        self.int1 = null;
        self.int2 = 2;
        self.int3 = 3;
        self.str1 = null;
        self.str2 = "hi";
    }
}