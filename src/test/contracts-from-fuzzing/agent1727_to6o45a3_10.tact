// optional persistent fields with init assignment
contract OptionalPrimitive {
    oi: Int?;
    ob: Bool?;
    os: String?;
    
    init() {
        self.oi = 10;
        self.ob = true;
        self.os = "test";
    }

    receive() {
        self.oi = null;
        self.ob = null;
        self.os = null;
    }
}