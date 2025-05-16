contract DefaultsMix {
    a: Int;
    b: Int = 1;
    c: Bool;
    d: Bool = true;
    s: String = "";

    init() {
        self.a = 7;
        self.c = false;
    }
}