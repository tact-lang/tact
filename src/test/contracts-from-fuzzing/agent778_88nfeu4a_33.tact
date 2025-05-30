contract ContractOptionDefaults {
    a: Int?=null;
    b: Bool?=null;
    c: Int = 5;

    init() {
        self.a=null;
        self.b=null;
        self.c=42;
    }
}