contract MixedTypes {
    a: Int = 42;
    b: Bool = false;
    c: String = "Hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    
    init() {
        self.d = 77;
        self.e = true;
        self.f = "hello";
    }
}