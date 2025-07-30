contract DefaultsAndInit {
    a: Int = 1;
    b: Int;
    c: String = "hi";
    d: String;

    init() {
        self.b = 2;
        self.d = "ho";
    }
}