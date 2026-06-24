// Testing contract with many optional fields of primitive types
contract TestContract {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    
    init() {
        self.a = 99;
        self.b = true;
        self.c = null;
        self.d = null;
    }

    receive() {
        if (self.a != null) { dump(self.a!!); }
        if (self.b != null) { dump(self.b!!); }
        if (self.c != null) { dump(self.c!!); }
        if (self.d != null) { dump(self.d!!); }
    }
}
