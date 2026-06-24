contract DefaultsMixed {
    a: Int = 2;
    b: Bool = true;
    c: String = "default";
    d: Int?;             // no default, implicitly null
    e: Bool? = false;    // default is false
    f: String? = "yes";  // default is "yes"

    init() {
        self.a = 42;
        self.b = false;
        self.c = "init";
        self.d = 100;
        self.e = null;
        self.f = null;
    }
}