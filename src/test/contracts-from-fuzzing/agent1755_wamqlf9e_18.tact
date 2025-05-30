contract ContractOpts {
    a: Int as uint32;
    b: Int as int5;
    c: Bool;
    d: String;
    init() {
        self.a = 42;
        self.b = -3;
        self.c = true;
        self.d = "xyz";
    }
}