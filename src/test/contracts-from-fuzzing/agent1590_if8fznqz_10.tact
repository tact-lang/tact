contract PrimitiveMix {
    int1: Int as int8;
    int2: Int as int64;
    int3: Int as uint32;
    flag: Bool;
    text: String;

    init() {
        self.int1 = 1;
        self.int2 = 100;
        self.int3 = 42;
        self.flag = true;
        self.text = "hi";
    }
}