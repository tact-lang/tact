contract PrimitivesMix {
    i1: Int;
    b1: Bool;
    optB1: Bool?;
    optI1: Int?;
    s1: String;
    optS1: String?;

    init() {
        self.i1 = 10;
        self.b1 = false;
        self.optB1 = null;
        self.optI1 = null;
        self.s1 = "abc";
        self.optS1 = null;
    }
}