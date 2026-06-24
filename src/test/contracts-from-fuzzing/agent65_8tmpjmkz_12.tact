contract MixedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int;         // no default
    d: String;      // no default
    e: String = "x";
    f: Address;     // no default

    init() {
        self.c = 100;
        self.d = "hello";
        self.f = myAddress();
    }
}