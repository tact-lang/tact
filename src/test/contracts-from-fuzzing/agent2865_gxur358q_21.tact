contract DefaultsAndOptionalsMixed {
    a: Int? = null;
    b: Bool = false;
    c: Int?;
    d: String = "x";
    e: Bool?;

    init() {
        self.c = 42;
        self.e = null;
    }
}