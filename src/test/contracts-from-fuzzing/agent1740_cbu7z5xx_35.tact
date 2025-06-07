contract PersistenceChecks {
    a: Int;
    b: Bool = true;
    c: String;

    init() {
        self.a = 123;
        self.c = "zzz";
    }
    
    receive() {
        self.a += 1;
    }
    
    get fun getA(): Int {
        return self.a;
    }
}