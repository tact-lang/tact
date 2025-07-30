contract DefaultsMix {
    a: Int = 1;
    b: Int? = null;
    c: String = "a";
    d: String? = null;
    e: Bool = true;
    f: Bool? = null;
    g: Address? = null;
    h: Bool;
    init() {
        self.h = false;
    }
}