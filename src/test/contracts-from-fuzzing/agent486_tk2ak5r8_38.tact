contract DefaultsAndManual {
    a: Int = 10;
    b: Int;
    c: Bool = true;
    d: Bool;
    s: String = "yes";
    t: String;

    init() {
        self.b = 5;
        self.d = false;
        self.t = "no";
    }
}