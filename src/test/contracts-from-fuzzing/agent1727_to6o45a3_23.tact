// contract with many optional primitive persistent fields
contract OptPrimitives {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    s1: String?;
    s2: String?;

    receive() {
        self.a = null;
        self.b = 444;
        self.c = true;
        self.d = null;
        self.s1 = "ok";
        self.s2 = null;
    }
}