contract DefaultsAndOptionals {
    a: Int = 42;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Address? = null;
    
    init() {
        self.a = 1;
        self.b = false;
        self.c = "";
        self.d = null;
        self.e = null;
    }
}