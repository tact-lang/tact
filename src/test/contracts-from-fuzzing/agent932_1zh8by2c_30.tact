contract DefaultsAndOptionals {
    a: Int = 5;
    b: Bool = true;
    c: String = "ban";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.d = 10;
        self.e = false;
        self.f = "hi";
    }
}