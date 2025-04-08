contract DefaultsAndInit {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int;

    init() {
        self.d = 42;
    }
}