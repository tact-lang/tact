contract DefaultsVsInit {
    a: Int = 10;
    b: Bool = false;
    c: String = "foo";
    d: Int;
    e: Bool;

    init() {
        self.d = 20;
        self.e = true;
    }
}