contract ManyBoolIntOpt {
    a: Bool = true;
    b: Bool?;
    c: Bool? = false;
    d: Int = 1;
    e: Int?;
    f: Int? = 42;

    init() {
        self.b = null;
        self.e = null;
    }
}