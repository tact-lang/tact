contract MixedDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    
    init() {
        self.a = 1;
        self.b = true;
        self.c = "bye";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}