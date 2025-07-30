contract IntSerialization {
    num1: Int as int32;
    num2: Int as uint64;
    num3: Int as coins; // variable length coin serialization

    init() {
        self.num1 = 100;
        self.num2 = 12345678;
        self.num3 = ton("1");
    }
}