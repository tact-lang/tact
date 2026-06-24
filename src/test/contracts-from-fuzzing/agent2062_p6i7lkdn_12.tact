contract DefaultsVsInit {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";

    init() {
        self.a = 42;
        self.b = true;
        self.c = "changed";
    }
}