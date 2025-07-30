contract DefaultsCombo {
    a: Int = 1;
    b: Int;
    c: Bool = false;
    d: Bool;
    s: String = "x";
    t: String;

    init() {
        self.b = 2;
        self.d = true;
        self.t = "y";
    }
}