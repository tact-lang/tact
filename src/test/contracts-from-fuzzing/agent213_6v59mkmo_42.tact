contract DefaultsAndInit {
    a: Int = 5;
    b: Bool = true;
    s: String = "abc";

    init() {
        self.a = 77;
        self.b = false;
        self.s = "zzz";
    }
}